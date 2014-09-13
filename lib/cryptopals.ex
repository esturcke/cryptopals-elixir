defmodule Cryptopals do
  use Bitwise;

  defp from_hex(hex) do
    Base.decode16! hex, case: :lower
  end

  defp to_hex(bytes) do
    Base.encode16 bytes, case: :lower
  end

  def hex_to_base64(hex) do
    from_hex(hex) |> Base.encode64
  end

  defp byte_xor(b1, b2) do
    [b1, b2]
    |> Enum.map(&:binary.bin_to_list/1)
    |> List.zip
    |> Enum.map(fn {a,b} -> a ^^^ b end)
    |> :binary.list_to_bin
  end

  def hex_xor(h1, h2) do
    byte_xor(from_hex(h1), from_hex(h2)) |> to_hex
  end

end
