defmodule Cryptopals do

  def challenge1 do
    Hex.to_base64 "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
  end

  def challenge2 do
    a = "1c0111001f010100061a024b53535009181c"
    b = "686974207468652062756c6c277320657965"
    Hex.xor(a, b)
  end

  defp single_byte_xor(ct, n) do
    <<n>>
    |> Bytes.to_hex
    |> String.duplicate(div String.length(ct), 2)
    |> Hex.xor(ct)
    |> Bytes.from_hex
  end

  def challenge3 do
    ct  = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
    0..255
    |> Enum.map(fn n -> single_byte_xor(ct, n) end)
    |> Enum.max_by &English.score(&1)
  end

  def challenge4 do
    cts = Utils.lines("data/challenge4.txt")
    pts = for ct <- cts, n <- 0..255, do: single_byte_xor(ct, n)
    pts |> Enum.max_by &English.score(&1)
  end

  def challenge5 do
    pt = """
    Burning 'em, if you ain't quick and nimble
    I go crazy when I hear a cymbal
    """ |> String.rstrip
    Bytes.xor_cycled(pt, "ICE") |> Bytes.to_hex
  end

end
