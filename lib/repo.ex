defmodule Tcks.Repo do
  use Ecto.Repo,
    otp_app: :tcks_report,
    adapter: Ecto.Adapters.Tds
end
