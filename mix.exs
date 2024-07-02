defmodule DvzEmiTicketsReportTask.MixProject do
  use Mix.Project

  def project do
    [
      app: :tcks_report,
      version: "0.1.0-beta",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {TcksReport.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.10"},
      {:tds, ">= 0.0.0"},
      {:quantum, "~> 3.0"},
      {:hackney, "~> 1.20"},
      {:tesla, "~> 1.9"},
      {:swoosh, "~> 1.16"},
      {:jason, "~> 1.4"},
      {:uuid, "~> 1.1"}
    ]
  end
end
