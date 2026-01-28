# Jaffle Shop DBT - Pre-seeded PostgreSQL

This [image](https://hub.docker.com/r/alexdoehl/jaffle-shop-dbt) provides a PostgreSQL 17 database pre-loaded with the **Jaffle Shop** dataset. It is specifically designed for learning and testing **dbt** (data build tool) without the need for manual data loading.

## 🚀 Features

- **Instant Start**: Data is already "baked" into the image. No waiting for CSV imports.
- **Pre-defined Schema**: All raw data is located in the `raw` schema.
- **DBT Ready**: Perfect for use with `dbt-postgres` adapters.

## 🛠 Usage

To start the container, run:

```bash
docker run --name jaffle-db -d -p 5432:5432 alexdoehl/jaffle-shop-dbt:latest
```

## 🔌 Connection Details:

- **Host**: `localhost`
- **Port**: `5432`
- **User**: `pguser`
- **Password**: `pgpass`
- **Database**: `dbt`


## 📊 Database Structure

The database contains a raw schema with the following tables:
- `raw.customers`
- `raw.stores`
- `raw.products`
- `raw.supplies`
- `raw.orders`
- `raw.items`


## 🔐 Security Note

This is a development image. It is configured with a default user pguser created during the build process. Do not use this in production environments.


## 🐳 How it was built

The image uses a multi-stage Docker build to initialize the database and import CSV files using \COPY commands during the build phase, resulting in a ready-to-use data directory.

