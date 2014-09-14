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

  def xor_cycled(x, y) do
    times = div((byte_size(x) - 1), byte_size(y)) + 1
    y = y |> String.duplicate(times) |> String.slice 0..(byte_size(x)-1)
    xor(x, y)
  end

end
