defmodule Hex do

  defp to_bytes(x), do: Bytes.from_hex(x)
  defp from_bytes(x), do: Bytes.to_hex(x)

  def xor(x, y) do
    Bytes.xor(to_bytes(x), to_bytes(y)) |> from_bytes
  end

  def to_base64(x), do: x |> to_bytes |> Base.encode64

end
