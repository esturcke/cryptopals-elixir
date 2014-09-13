defmodule Bytes do
  use Bitwise;

  def from_hex(hex) do
    Base.decode16! hex, case: :lower
  end

  def to_hex(bytes) do
    Base.encode16 bytes, case: :lower
  end

  def xor(x, y) do
    [x, y]
    |> Enum.map(&:binary.bin_to_list/1)
    |> List.zip
    |> Enum.map(fn {x, y} -> x ^^^ y end)
    |> :binary.list_to_bin
  end

end
