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

end 
