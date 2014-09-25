defmodule Bytes do
  use Bitwise;

  def from_hex(hex) do
    Base.decode16! hex, case: :lower
  end

  def to_hex(bytes) do
    Base.encode16 bytes, case: :lower
  end

  def from_base64(s) do
    s |> String.replace("\n", "") |> Base.decode64!
  end

  def bytewise_merge(xs, f) do
    xs
    |> Enum.map(&:binary.bin_to_list/1)
    |> List.zip
    |> Enum.map(f)
    |> :binary.list_to_bin
  end

  def xor(x, y) do
    bytewise_merge([x, y], fn {x, y} -> x ^^^ y end)
  end

  def xor_cycled(x, y) do
    times = div((byte_size(x) - 1), byte_size(y)) + 1
    y = y |> :binary.copy(times) |> :binary.part {0, byte_size(x)}
    xor(x, y)
  end

  def bits_set(n) when is_integer(n) and 0 <= n and n < 256 do
    n = (n &&& 0b01010101) + (n >>> 1 &&& 0b01010101)
    n = (n &&& 0b00110011) + (n >>> 2 &&& 0b00110011)
        (n &&& 0b00001111) + (n >>> 4 &&& 0b00001111)
  end

  def bits_set(x) when is_binary(x) do
    x
    |> :binary.bin_to_list
    |> Enum.map(&bits_set/1)
    |> Enum.sum
  end

  def edit_distance(x, y) do
    xor(x, y) |> bits_set
  end

  @doc """
  Split into blocks 
  """
  def transpose(x, n) do
    for i <- 0..n-1 do
      l = div(byte_size(x) - i - 1, n)
      block = for j <- 0..l, do: x |> :binary.at i + j * n
      block |> :binary.list_to_bin
    end
  end

end
