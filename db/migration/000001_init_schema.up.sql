CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "username" varchar,
  "name" varchar,
  "bio" text,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "avatar" varchar,
  "role" varchar,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "submates" (
  "id" bigserial PRIMARY KEY,
  "identifier" varchar,
  "name" varchar,
  "description" text
);

CREATE TABLE "submate_members" (
  "id" bigserial PRIMARY KEY,
  "user_id" bigserial,
  "submate_id" bigserial,
  "note" text
);

CREATE TABLE "subscriptions" (
  "id" bigserial PRIMARY KEY,
  "name" varchar,
  "submate_id" integer
);

CREATE TABLE "subscription_submate_members" (
  "subscription_id" bigserial,
  "submate_member_id" bigserial
);

ALTER TABLE "submate_members" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "submate_members" ADD FOREIGN KEY ("submate_id") REFERENCES "submates" ("id");

ALTER TABLE "subscriptions" ADD FOREIGN KEY ("submate_id") REFERENCES "submates" ("id");

ALTER TABLE "subscription_submate_members" ADD FOREIGN KEY ("subscription_id") REFERENCES "subscriptions" ("id");

ALTER TABLE "subscription_submate_members" ADD FOREIGN KEY ("submate_member_id") REFERENCES "submate_members" ("id");
