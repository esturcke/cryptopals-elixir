defmodule English do

  # http://www.data-compression.com/english.html
  defp english do
    %{
      ?a  => 0.0651738,
      ?b  => 0.0124248,
      ?c  => 0.0217339,
      ?d  => 0.0349835,
      ?e  => 0.1041442,
      ?f  => 0.0197881,
      ?g  => 0.0158610,
      ?h  => 0.0492888,
      ?i  => 0.0558094,
      ?j  => 0.0009033,
      ?k  => 0.0050529,
      ?l  => 0.0331490,
      ?m  => 0.0202124,
      ?n  => 0.0564513,
      ?o  => 0.0596302,
      ?p  => 0.0137645,
      ?q  => 0.0008606,
      ?r  => 0.0497563,
      ?s  => 0.0515760,
      ?t  => 0.0729357,
      ?u  => 0.0225134,
      ?v  => 0.0082903,
      ?w  => 0.0171272,
      ?x  => 0.0013692,
      ?y  => 0.0145984,
      ?z  => 0.0007836,
      ?\s => 0.1918182
    }
  end

  defp add(counts, c, l) do
    n = (counts |> Map.get c, 0) + 1/l
    counts |> Map.put c, n
  end

  defp frequency(s) do
    s
    |> String.downcase
    |> String.to_char_list
    |> Enum.reduce(%{}, fn c, f -> f |> add c, String.length(s) end) 
  end

  defp square(x), do: x * x

  defp likeEnglish(a) do
    1 - (
      english
      |> Enum.map(fn {c, f} -> square(f - (a |> Map.get c, 0)) end) 
      |> Enum.sum
      |> :math.sqrt
    )
  end

  def score(string) do
    if String.valid?(string) do
      string
      |> frequency
      |> likeEnglish
    else
      0.0
    end
  end

end
