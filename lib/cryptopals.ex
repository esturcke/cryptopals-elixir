defmodule Cryptopals do

  def hex_to_base64(hex) do
    Base.decode16!(hex, case: :mixed) |> Base.encode64
  end

end
