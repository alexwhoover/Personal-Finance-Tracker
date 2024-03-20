-- Table to store transactions from all accounts, including credit and chequing accounts

CREATE TABLE IF NOT EXISTS "transactions" (
    "id" INTEGER,
    "date" TEXT NOT NULL,
    "amount" NUMERIC NOT NULL,
    "description" TEXT,
    "account_id" INTEGER,
    "category_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("account_id") REFERENCES "accounts"("id")
);

-- Table to store all accounts
CREATE TABLE IF NOT EXISTS "accounts" (
    "id" INTEGER,
    "institution" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "balance" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

-- Table to store all transaction categories
CREATE TABLE IF NOT EXISTS "categories" (
    "id" INTEGER,
    "category_code" TEXT UNIQUE NOT NULL,
    "category_desc" TEXT NOT NULL, "type" TEXT,
    PRIMARY KEY("id")
);

-- Trigger to update the account balance in the accounts table when a new transaction is inserted in the transactions table
CREATE TRIGGER "balance_update"
AFTER INSERT ON "transactions"
FOR EACH ROW
BEGIN
        UPDATE "accounts" SET "balance" = "balance" + NEW."amount"
        WHERE "id" = NEW."account_id";
END;

-- Simplified view of transactions
CREATE VIEW "simple_transactions" AS
SELECT "date", "amount", "description", "category_desc" AS 'category'
FROM "categories"
JOIN "transactions" ON "categories"."id" = "transactions"."category_id"
ORDER BY "date" DESC