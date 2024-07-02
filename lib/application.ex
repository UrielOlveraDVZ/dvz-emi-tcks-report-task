defmodule TcksReport.Application do
  use Application
  @impl true
  def start(_type, _args) do
    children = [
      Tcks.Repo,
      TcksReport.Scheduler
    ]

    opts = [strategy: :one_for_one, name: :tcks_report]
    Supervisor.start_link(children, opts)
  end
end
