defmodule OgmaEx.Repo do
  use Ecto.Repo,
    otp_app: :ogmaEx,
    adapter: Ecto.Adapters.Postgres
  
end
