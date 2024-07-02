defmodule TcksReport.Utils.Utils do

  def get_sequence() do
    {sequence, _} =
      UUID.uuid4()
      |> String.slice(30, 36)
      |> Integer.parse(16)

    sequence
    |> Integer.to_string()
    |> String.pad_leading(8, "0")
  end
end
