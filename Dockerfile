FROM postgres:17-alpine AS builder

COPY jaffle-data/*.csv /data/
COPY jaffle-data/init.sql /docker-entrypoint-initdb.d/

ENV POSTGRES_USER=pguser \
    POSTGRES_DB=dbt \
    POSTGRES_PASSWORD=pgpass

RUN docker-entrypoint.sh postgres & \
    until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do sleep 2; done && \
    echo "Importing data... this may take 10-15 minutes or more ..." && \
    sleep 60 && \
    gosu postgres pg_ctl -D "$PGDATA" -m fast stop && \
    gosu postgres pg_resetwal -f "$PGDATA"


FROM postgres:17-alpine

COPY --from=builder /var/lib/postgresql/data /var/lib/postgresql/data

EXPOSE 5432
