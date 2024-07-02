defmodule TcksReport.Scheduler do
  use Quantum, otp_app: :tcks_report

  alias TcksReport.Mail.Mailer
  alias TcksReport.Mail.Email

  require Logger

  def tcks_report_scheduler() do
    tickets = get_tickets_by_status(9)

    for ticket <- tickets do
      if get_attempts(ticket.id) > 5 do
        with body <- create_body(ticket),
             {:ok, _response} <- Tesla.post("", body) do
          # update attemps + 1
        end
      else
        send_mail(ticket)
      end
    end
  end

  defp send_mail(data) do
    email = Email.build_mail(data)

    case Mailer.deliver(email) do
      {:ok, _} -> "Mail sent to #{data.email} successfuly"
      {:error, _error} -> "Can not send mail because email is empty"
    end
  end

  defp create_body(data) do
    data
  end

  # ==============================================================

  defp get_tickets_by_status(status) do
    [
      %{id: 1, email: "u.alejandro23@gmail.com", status: 9},
      %{id: 2, email: "", status: 2},
      %{id: 3, email: "", status: 9},
      %{id: 4, email: "", status: 9},
      %{id: 5, email: "", status: 2}
    ]
    |> Enum.filter(fn item -> item.status == status end)
  end

  defp get_attempts(id) do
    case id do
      1 -> 1
      2 -> 2
      3 -> 4
      4 -> 5
      5 -> 5
    end
  end
end
