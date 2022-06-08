from typing import List

from fastapi import FastAPI, Depends
from starlette.responses import Response

from crud import CrudService
from database import db
from models import ShelfCreate, Shelf, Result

app = FastAPI()


@app.on_event("startup")
async def on_startup():
    await db.ensure_created()


@app.get("/shelfs/{id}", response_model=Shelf)
async def get_shelf_by_id(id: int, crud: CrudService = Depends()):
    return await crud.get_by_id(id)


@app.get("/shelfs", response_model=List[Shelf])
async def get_list_of_all_shelfs(response: Response, crud: CrudService = Depends()):
    response.headers["X"] = str(await crud.count_all())
    return await crud.get_all()


@app.post("/shelfs", response_model=Result)
async def create(model: ShelfCreate, crud: CrudService = Depends()):
    await crud.create(model)
    return Result(status="Table created successfully.")


@app.put("/shelfs/{id}", response_model=Result)
async def update_shelfs_by_id(id: int, model: ShelfCreate, crud: CrudService = Depends()):
    await crud.update(id, model)
    return Result(status="Table updated successfully.")


@app.delete("/shelfs/{id}", response_model=Result)
async def delete_shelfs_by_id(id: int, crud: CrudService = Depends()):
    await crud.delete(id)
    return Result(status="Table deleted successfully.")
