defmodule BytesTest do
  use ExUnit.Case
  import Bytes

  test "Hamming distance" do
    assert edit_distance("this is a test", "wokka wokka!!!") == 37
  end

  test "Transpose" do
    assert transpose("abc", 1)     == ["abc"] 
    assert transpose("abcdefg", 3) == ["adg", "be", "cf"] 
    assert transpose("abcde",   5) == ["a", "b", "c", "d", "e"] 
  end

end 
