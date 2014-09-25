defmodule Cryptopals do

  def challenge1 do
    Hex.to_base64 "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
  end

  def challenge2 do
    a = "1c0111001f010100061a024b53535009181c"
    b = "686974207468652062756c6c277320657965"
    Hex.xor(a, b)
  end

  @doc """
  # Single-byte XOR cipher

  The hex encoded string:
  
  ```
  1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736
  ```

  ...has been XOR'd against a single character. Find the key, decrypt the
  message.

  You can do this by hand. But don't: write code to do it for you.

  How? Devise some method for "scoring" a piece of English plaintext.
  Character frequency is a good metric. Evaluate each output and choose
  the one with the best score.
  """
  def challenge3 do
    ct  = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736" |> Bytes.from_hex
    key = ct |> Crypto.find_xor_byte_key
    ct |> Bytes.xor_cycled <<key>>
  end

  def challenge4 do
    cts = Utils.lines("data/challenge4.txt")
    pts = for ct <- cts, n <- 0..255, do: Bytes.xor_cycled(ct |> Bytes.from_hex, <<n>>)
    pts |> Enum.max_by &English.score(&1)
  end

  def challenge5 do
    pt = """
    Burning 'em, if you ain't quick and nimble
    I go crazy when I hear a cymbal
    """ |> String.rstrip
    Bytes.xor_cycled(pt, "ICE") |> Bytes.to_hex
  end

  @doc """
  # Break repeating-key XOR

  *[Set 1 / Challenge 6](http://cryptopals.com/sets/1/challenges/6/)*

  [There's a file here](http://cryptopals.com/static/challenge-data/6.txt).
  It's been base64'd after being encrypted with repeating-key XOR.

  Decrypt it.
  """
  def challenge6 do
    # fetch the cypher text
    ct = "data/challenge6.txt" |> File.read! |> Bytes.from_base64

    # find the key size by looking for the min edit distance between
    # blocks of the cypher text
    keysize = 2..40 |> Enum.min_by(
      fn l ->
        (for i <- 0..41, do: ct |> binary_part i * l, l)
        |> Enum.chunk(2)
        |> Enum.map(fn [a, b] -> Bytes.edit_distance(a, b)/l end)
        |> Enum.sum
      end
    )

    # construct the key by 
    blocks = ct |> Bytes.transpose keysize
    key    = blocks
      |> Enum.map(&Crypto.find_xor_byte_key/1) 
      |> :binary.list_to_bin
    Bytes.xor_cycled(ct, key)
  end

end
