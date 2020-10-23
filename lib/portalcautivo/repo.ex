defmodule Portalcautivo.Repo do
  use Ecto.Repo,
    otp_app: :portalcautivo,
    adapter: Ecto.Adapters.Postgres
end
