defmodule EnglishTest do
  use ExUnit.Case

  test "Can recognize gibberish" do
    assert English.score("This is an English string") > English.score("heiuw fheiu fhh ewif"); 
  end

end 
