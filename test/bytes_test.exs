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

  test "Chunk into blocks" do
    assert chunk("a"      , 1) == ["a"               ]
    assert chunk("ab"     , 2) == ["ab"              ]
    assert chunk("abc"    , 3) == ["abc"             ]
    assert chunk("abcd"   , 2) == ["ab" , "cd"       ]
    assert chunk("abcde"  , 2) == ["ab" , "cd", "e"  ]
    assert chunk("abcdef" , 2) == ["ab" , "cd", "ef" ]
  end

end 
