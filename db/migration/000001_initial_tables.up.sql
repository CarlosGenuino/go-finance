CREATE TABLE "users" (
    "id" serial primary key not null,
    "username" varchar not null,
    "password" varchar not null,
    "email" varchar unique not null,
    "created_at" timestamptz not null default(now())
);

CREATE TABLE "categories" (
    "id" serial primary key not null,
    "user_id" int not null,
    "title" varchar not null,
    "type" varchar not null,
    "description" varchar unique not null,
    "created_at" timestamptz not null default(now())
);

ALTER TABLE "categories" ADD FOREIGN KEY ("user_id") REFERENCES "users"("id");


CREATE TABLE "accounts" (
    "id" serial primary key not null,
    "user_id" int not null,
    "category_id" int not null,
    "title" varchar not null,
    "type" varchar not null,
    "description" varchar unique not null,
    "value" integer unique not null,
    "date" date not null,
    "created_at" timestamptz not null default(now())
);

ALTER TABLE "accounts" ADD FOREIGN KEY ("user_id") REFERENCES "users"("id");
ALTER TABLE "accounts" ADD FOREIGN KEY ("category_id") REFERENCES "categories"("id");