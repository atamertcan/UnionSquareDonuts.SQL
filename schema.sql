-- Ingredients
-- We certainly need to keep track of our ingredients.
-- Some of the typical ingredients we use include flour, yeast, oil, butter, and several different types of sugar.
-- Moreover, we would love to keep track of the price we pay per unit of ingredient (whether it’s pounds, grams, etc.).

CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL,
    "unit" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL,
    "price_per_donut" REAL NOT NULL,
    PRIMARY KEY ("id")

);

CREATE TABLE "donut_ingredients" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id"),
    PRIMARY KEY ("donut_id", "ingredient_id")

);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    "order_number" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")

);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")

);

CREATE TABLE "order_contents" (
    "customer_id" INTEGER,
    "donut_id" INTEGER,
    "order_id" INTEGER,
    "qty" INTEGER,
    PRIMARY KEY ("order_id", "donut_id", "customer_id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")

);
