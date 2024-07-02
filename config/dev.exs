import Config

config :tesla, adapter: Tesla.Adapter.Hackney
config :swoosh, :api_client, Swoosh.ApiClient.Hackney

config :tcks_report, TcksReport.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: System.get_env("SENDGRID_API_KEY"),
  mail_sender: System.get_env("SENDGRID_EMAIL_SENDER")

config :tcks_report, ecto_repos: [Tcks.Repo]

config :tcks_report, TcksReport.Repo,
  username: System.get_env("TCKS_DB_USER"),
  password: System.get_env("TCKS_DB_PASS"),
  hostname: System.get_env("TCKS_DB_HOST"),
  port: 1433,
  database: System.get_env("TCKS_DB_NAME"),
  pool_size: String.to_integer("10"),
  timeout: :infinity,
  queue_target: :infinity,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

config :tcks_report, TcksReport.Scheduler,
  jobs: [
    {"0 */12 * * *", {TcksReport.Scheduler, :tcks_report_scheduler, []}}
  ]
