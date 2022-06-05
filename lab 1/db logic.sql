CREATE TABLE "Box" (
  "id" int,
  "vegname" varchar,
  "date" int
);

CREATE TABLE "Date" (
  "id" integer,
  "num" int
);

CREATE TABLE "Shelf" (
  "id" int,
  "box" int,
  "insur" int
);

CREATE TABLE "Company" (
  "id" int,
  "cname" varchar
);

CREATE TABLE "Vegname" (
  "id" int,
  "name" varchar
);

CREATE TABLE "User" (
  "id" int,
  "name" varchar,
  "order" int
);

ALTER TABLE "Box" ADD FOREIGN KEY ("vegname") REFERENCES "Vegname" ("id");

ALTER TABLE "Box" ADD FOREIGN KEY ("date") REFERENCES "Date" ("id");

ALTER TABLE "Shelf" ADD FOREIGN KEY ("box") REFERENCES "Box" ("id");

ALTER TABLE "Shelf" ADD FOREIGN KEY ("insur") REFERENCES "Company" ("cname");

ALTER TABLE "User" ADD FOREIGN KEY ("order") REFERENCES "Shelf" ("id");
