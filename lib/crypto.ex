defmodule Crypto do

  def find_xor_byte_key(ct) do
    0..255 |> Enum.max_by(fn k -> ct |> Bytes.xor_cycled(<<k>>) |> English.score end)
  end

  def decrypt_aes_ecb(ct, key) do
    iv = <<0>> |> :binary.copy 16
    s  = byte_size ct
    pt = ct
    |> Bytes.chunk(16)
    |> Enum.map(fn ct -> :crypto.block_decrypt :aes_cbc128, key, iv, ct end)
    |> Bytes.join
    pt |> :binary.part { 0, s - :binary.at(pt, s - 1) } 
  end

end
