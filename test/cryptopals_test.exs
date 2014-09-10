defmodule CryptopalsTest do
  use ExUnit.Case

  test "Set 1 / Challenge 1 - Convert hex to base64" do
    hex    = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    base64 = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
    assert base64 == Cryptopals.hex_to_base64 hex
  end

end
