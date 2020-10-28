FROM "elixir:otp-22"

ARG APP_PATH=./api/
ARG ENTRYPOINT_PATH=./docker/api/entrypoint.sh
ARG PGHOST
ARG PGDATABASE
ARG PGPASSWORD
ARG PGPORT
ARG PGUSER
ARG PHX_VERSION=1.5.6
ARG WORKDIR=/usr/src/app/

ENV PGHOST $PGHOST
ENV PGDATABASE $PGDATABASE
ENV PGPASSWORD $PGPASSWORD
ENV PGPORT $PGPORT
ENV PGUSER $PGUSER

# Install postgres and node
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get update && apt-get install --yes \
      inotify-tools                         \
      nodejs                                \
      postgresql-client

# Install phoenix
RUN mix local.hex --force &&                                  \
      mix archive.install --force hex phx_new $PHX_VERSION && \
      mix local.rebar --force

WORKDIR $WORKDIR

# Install node dependencies + webpack
COPY $APP_PATH/assets ./assets/
RUN cd assets/ && npm --yes install

# Install phoenix dependencies
COPY $APP_PATH/mix.exs .
RUN mix deps.get --force

# Copy application
COPY $APP_PATH .

# Compile application
RUN mix do deps.compile --include-children, compile

# Execute entrypoint
COPY $ENTRYPOINT_PATH /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
