defmodule CryptopalsTest do
  use ExUnit.Case
  import Cryptopals

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
    pt = "data/solution6.txt" |> File.read!
    assert challenge6 == pt
  end

end 
