defmodule CryptopalsTest do
  use ExUnit.Case

  test "Set 1 / Challenge 1 - Convert hex to base64" do
    assert Cryptopals.challenge1 == "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
  end

  test "Set 1 / Challenge 2 - Fixed XOR" do
    assert Cryptopals.challenge2 == "746865206b696420646f6e277420706c6179"
  end

  test "Set 1 / Challenge 3 - Single-byte XOR cipher" do
    assert Cryptopals.challenge3 == "Cooking MC's like a pound of bacon"
  end

end 
