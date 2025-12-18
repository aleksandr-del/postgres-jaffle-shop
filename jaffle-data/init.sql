-- Create raw schema and set as first in search path
CREATE SCHEMA IF NOT EXISTS raw;
SET search_path = raw, public;

-- Create tables in raw schema
CREATE TABLE IF NOT EXISTS raw.customers (
    id UUID PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS raw.stores (
    id UUID PRIMARY KEY,
    name VARCHAR(255),
    opened_at TIMESTAMP,
    tax_rate DECIMAL(4,2)
);

CREATE TABLE IF NOT EXISTS raw.products (
    sku VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(100),
    price INTEGER,
    description TEXT
);

CREATE TABLE IF NOT EXISTS raw.supplies (
    id VARCHAR(50),
    name VARCHAR(255),
    cost INTEGER,
    perishable BOOLEAN,
    sku VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS raw.orders (
    id UUID PRIMARY KEY,
    customer UUID,
    ordered_at TIMESTAMP,
    store_id UUID,
    subtotal INTEGER,
    tax_paid INTEGER,
    order_total INTEGER
);

CREATE TABLE IF NOT EXISTS raw.items (
    id UUID PRIMARY KEY,
    order_id UUID,
    sku VARCHAR(50)
);

-- Load data using COPY commands
\COPY raw.customers FROM '/data/raw_customers.csv' WITH CSV HEADER;
\COPY raw.stores FROM '/data/raw_stores.csv' WITH CSV HEADER;
\COPY raw.products FROM '/data/raw_products.csv' WITH CSV HEADER;
\COPY raw.supplies FROM '/data/raw_supplies.csv' WITH CSV HEADER;
\COPY raw.orders FROM '/data/raw_orders.csv' WITH CSV HEADER;
\COPY raw.items FROM '/data/raw_items.csv' WITH CSV HEADER;
