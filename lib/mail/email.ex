defmodule TcksReport.Mail.Email do
  import Swoosh.Email

  alias TcksReport.Mail.Template

  def build_mail(email) do
    content = Template.template()

    new()
    |> to(email)
    |> from(Application.get_env(:tcks_report, TcksReport.Mailer).mail_sender)
    |> subject("Request Failed")
    |> text_body(content)
  end
end
