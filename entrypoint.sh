#!/bin/bash

# Wait until postgres ready
while ! pg_isready -q -h $DBHOST -p $DBPORT -U $DBUSER
do
    echo "$(date) - waiting for database to start"
    sleep 2
done

# Create, migrate, seed
if [[ -z `psql -U postgres -Atqc "\\list $DBNAME" -h host.docker.internal` ]]; then
    echo "Database $DBNAME does not exist. Creating..."
    # createdb -E UTF8 $DBNAME -l en_US.UTF-8 -T template0 -U postgres -h host.docker.internal
    mix ecto.create
    mix ecto.migrate
    mix run priv/repo/seeds.exs
    echo "Database $DBNAME created."
fi

exec mix phx.server