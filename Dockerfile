# Official Elixir image
FROM elixir:latest

# Install Postgres
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools

# Create app dir and copy project
RUN mkdir /ogma
COPY . /ogma
WORKDIR /ogma

# Install Hex
RUN mix local.hex --force
RUN mix local.rebar

# Install deps
RUN mix deps.get

# Create db
RUN chmod +x /ogma/entrypoint.sh
CMD ["/ogma/entrypoint.sh"]
# RUN mix ecto.create && \
#     mix ecto.migrate && \
#     mix run priv/repo/seeds.exs

# Compile
RUN mix do compile
RUN mix phx.server