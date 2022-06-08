from typing import List

from fastapi import Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession, AsyncConnection
from sqlalchemy.sql import text

from database import db
from models import Shelf, ShelfCreate


class CrudService:
    def __init__(self, session: AsyncSession = Depends(db.get_session)):
        self._session = session

    async def get_by_id(self, id: int) -> Shelf:
        query = text("""SELECT * FROM Shelfs WHERE id=:id""")
        result = await self._session.execute(query, {"id": id})
        model = result.one_or_none()
        if not model:
            raise HTTPException(status_code=404, detail="Shelf not found.")
        return Shelf(
            id=model[0],
            box=model[1],
            insur=model[2],
        )

    async def count_all(self) -> int:
        query = text("""SELECT COUNT(*) FROM Shelfs""")
        result = await self._session.execute(query)
        return result.scalar()

    async def get_all(self) -> List[Shelf]:
        query = text("""SELECT id, box, insur FROM Shelfs""")
        result = await self._session.execute(query)
        shelf = []
        for row in result.all():
            Shelf = Shelf(
                id=row[0],
                box=row[1],
                insur=row[2],
            )
            shelf.append(Shelf)
        return shelf

    async def create(self, model: ShelfCreate) -> Shelf:
        query = text("""
            INSERT INTO Shelfs ( box, insur )
            VALUES (:box, :insur)
            """)
        result = await self._session.execute(query, model.dict())
        await self._session.commit()
        return result

    async def update(self, id: int, model: ShelfCreate) -> None:
        query = text("""
            UPDATE Shelfs 
            SET box=:box, insur=:insur
            WHERE id=:id
            """)
        params = {"id": id}
        params.update(model.dict())
        result = await self._session.execute(query, model.dict())
        await self._session.commit()
        return result

    async def delete(self, id: int) -> None:
        query = text("""DELETE FROM Shelfs WHERE id=:id""")
        await self._session.execute(query, {"id": id})
        await self._session.commit()
