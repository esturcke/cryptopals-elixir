defmodule CryptopalsTest do
  use ExUnit.Case

  test "Set 1 / Challenge 1 - Convert hex to base64" do
    hex    = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    base64 = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
    assert base64 == Cryptopals.hex_to_base64 hex
  end

  test "Set 1 / Challenge 2 - Fixed XOR" do
    a = "1c0111001f010100061a024b53535009181c"
    b = "686974207468652062756c6c277320657965"
    c = "746865206b696420646f6e277420706c6179"
    assert Cryptopals.hex_xor(a, b) == c
  end

end 
