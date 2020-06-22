# Official Elixir image
FROM elixir:latest

# Install Postgres
RUN apt-get update && \
    apt-get install -y postgresql-client

# Create app dir and copy project
RUN mkdir /ogma
COPY . /ogma
WORKDIR /ogma

# Install Hex
RUN mix local.hex --force
RUN mix local.rebar

# Install deps
RUN mix deps.get

# Compile
RUN mix do compile

# Create db
RUN chmod +x /ogma/entrypoint.sh
CMD ["/ogma/entrypoint.sh"]
# RUN mix ecto.create && \
#     mix ecto.migrate && \
#     mix run priv/repo/seeds.exs