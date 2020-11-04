#!/usr/bin/env sh

# Wait for database
echo "Waiting for database..."
DB_READY=1
while [ $DB_READY -ne 0 ]; do
  >/dev/null pg_isready --host=$PGHOST --port=$PGPORT --username=$PGUSER
  DB_READY=$?
done
echo "Aaahh database's up"

# Create database if not present
echo "Checking if database exist..."
psql -U postgres -lqt | cut -d \| -f 1 | grep -qw $PGDATABASE
if [ $? -ne 0 ]; then
  echo "Datbase not found. Creating database..."
  mix ecto.create
  if [ $? -ne 0 ]; then
    echo "Dang database creation failed :("
    # exit 1
  fi
fi
echo "Oh yeah ready to rumble"

# Migrate
mix ecto.migrate

# Launch app
mix phx.server
