defmodule BytesTest do
  use ExUnit.Case
  import Bytes

  test "Hamming distance" do
    assert edit_distance("this is a test", "wokka wokka!!!") == 37
  end

end 
