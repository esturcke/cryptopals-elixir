defmodule Utils do

  def lines(file) do
    file |> File.stream! |> Enum.map fn l -> l |> String.rstrip end
  end

end
