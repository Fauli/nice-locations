defmodule NiceLocations.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NiceLocationsWeb.Telemetry,
      NiceLocations.Repo,
      {DNSCluster, query: Application.get_env(:nice_locations, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NiceLocations.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: NiceLocations.Finch},
      # Start a worker by calling: NiceLocations.Worker.start_link(arg)
      # {NiceLocations.Worker, arg},
      # Start to serve requests, typically the last entry
      NiceLocationsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NiceLocations.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NiceLocationsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
