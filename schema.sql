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

-- Donuts
-- We’ll need to include our selection of donuts, past and present!
-- For each donut on the menu, we’d love to include three things:
--     * The name of the donut
--     * Whether the donut is gluten-free
--     * The price per donut
-- Oh, and it’s important that we be able to look up the ingredients for each of the donuts!


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

-- Customers
-- Oh, and we realize it would be lovely to keep track of some information about each of our customers.
-- We’d love to remember the history of the orders they’ve made. In that case, we think we should store:
--     * A customer’s first and last name
--     * A history of their orders

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
