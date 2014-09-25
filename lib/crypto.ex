defmodule Crypto do

  def find_xor_byte_key(ct) do
    0..255 |> Enum.max_by(fn k -> ct |> Bytes.xor_cycled(<<k>>) |> English.score end)
  end

end
