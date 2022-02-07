CREATE TABLE "Cars" (
  "id" integer,
  "model" varchar,
  "markid" int,
  "numb" int
);

CREATE TABLE "Numb" (
  "id" integer,
  "num" int
);

CREATE TABLE "User" (
  "id" int,
  "CarId" int,
  "insur" int,
  "license" int
);

CREATE TABLE "Insurance" (
  "id" int,
  "is" bool
);

CREATE TABLE "Dlicense" (
  "id" int,
  "is" bool
);

CREATE TABLE "Marks" (
  "id" int,
  "mark" varchar
);

ALTER TABLE "Cars" ADD FOREIGN KEY ("markid") REFERENCES "Marks" ("id");

ALTER TABLE "Cars" ADD FOREIGN KEY ("numb") REFERENCES "Numb" ("id");

ALTER TABLE "User" ADD FOREIGN KEY ("CarId") REFERENCES "Cars" ("id");

ALTER TABLE "User" ADD FOREIGN KEY ("insur") REFERENCES "Insurance" ("is");

ALTER TABLE "User" ADD FOREIGN KEY ("license") REFERENCES "Dlicense" ("is");
