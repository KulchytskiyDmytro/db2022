from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession, AsyncConnection
from sqlalchemy.orm import sessionmaker
from sqlmodel import SQLModel

SQLALCHEMY_DATABASE_URI: str

class Database:
    def __init__(self):
        self.db_uri = SQLALCHEMY_DATABASE_URI
        self.engine = create_async_engine(self.db_uri, echo=False, future=True)
        self.async_session = sessionmaker(self.engine, class_=AsyncSession, expire_on_commit=False)

    def close_engine(self):
        self.engine.dispose()

    async def ensure_created(self):
        async with self.engine.begin() as conn:
            await conn.run_sync(SQLModel.metadata.create_all)

    async def get_session(self) -> AsyncSession:
        async with self.async_session() as session:
            try:
                yield session
            except Exception as ex:
                print("Database session error occurred", ex)
                await session.rollback()
                raise
            finally:
                await session.close()


db = Database()
