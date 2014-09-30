defmodule CryptopalsTest do
  use ExUnit.Case
  import Cryptopals

  def vanilla_ice, do: "data/play-that-funky-music.txt" |> File.read!

  test "Set 1 / Challenge 1 - Convert hex to base64" do
    assert challenge1 == "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
  end

  test "Set 1 / Challenge 2 - Fixed XOR" do
    assert challenge2 == "746865206b696420646f6e277420706c6179"
  end

  test "Set 1 / Challenge 3 - Single-byte XOR cipher" do
    assert challenge3 == "Cooking MC's like a pound of bacon"
  end

  test "Set 1 / Challenge 4 - Detect single-character XOR" do
    assert challenge4 == "Now that the party is jumping\n"
  end

  test "Set 1 / Challenge 5 - Implement repeating-key XOR" do
    ct = """
    0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272
    a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f
    """ |> String.replace "\n", ""
    assert challenge5 == ct

  end

  test "Set 1 / Challenge 6 - Break repeating-key XOR" do
    assert challenge6 == vanilla_ice
  end

  test "Set 1 / Challenge 7 - AES in ECB mode" do
    assert challenge7 == vanilla_ice
  end

  test "Set 1 / Challenge 8 - Detect AES in ECB mode" do
    ct = """
    d880619740a8a19b7840a8a31c810a3d08649af70dc06f4fd5d2d69c744cd283
    e2dd052f6b641dbf9d11b0348542bb5708649af70dc06f4fd5d2d69c744cd283
    9475c9dfdbc1d46597949d9c7e82bf5a08649af70dc06f4fd5d2d69c744cd283
    97a93eab8d6aecd566489154789a6b0308649af70dc06f4fd5d2d69c744cd283
    d403180c98c8f6db1f2a3f9c4040deb0ab51b29933f2c123c58386b06fba186a
    """ |> String.replace "\n", ""
    assert challenge8 == ct
  end

  test "Set 2 / Challenge 9 - Implement PKCS#7 padding" do
    padded = "YELLOW SUBMARINE" <> <<4,4,4,4,>>
    assert challenge9 == padded
  end

  test "Set 2 / Challenge 10 - Implement CBC mode" do
    assert challenge10 == vanilla_ice
  end

end 
