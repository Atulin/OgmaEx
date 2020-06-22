defmodule OgmaEx.Repo do
  use Ecto.Repo,
    otp_app: :ogmaEx,
    adapter: Ecto.Adapters.Postgres

  def init(_, cfg) do
    cfg = cfg
    |> Keyword.put(:username, System.get_env("DBUSER"))
    |> Keyword.put(:password, System.get_env("DBPASS"))
    |> Keyword.put(:database, System.get_env("DBNAME"))
    |> Keyword.put(:hostname, System.get_env("DBHOST"))
    |> Keyword.put(:port, System.get_env("DBPORT") |> String.to_integer)
    {:ok, cfg}
  end
  
end
