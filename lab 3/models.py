from sqlmodel import SQLModel, Field


class Result(SQLModel):
    status: str


class Shelf(SQLModel, table=True):
    __tablename__ = "shelf"
    id: int = Field(primary_key=True)
    box: int = Field()
    insur: str = Field()


class ShelfCreate(SQLModel):
    box: int = Field(default="2")
    insur: str = Field(default="VegiseComp")
