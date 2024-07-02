defmodule TcksReport.Mail.Template do
  require EEx

  EEx.function_from_file(:def, :template, "./lib/mail/mail.html.eex", [])
end
