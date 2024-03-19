defmodule NiceLocations.Repo do
  use Ecto.Repo,
    otp_app: :nice_locations,
    adapter: Ecto.Adapters.Postgres
end
