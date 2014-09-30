defmodule Crypto do

  def find_xor_byte_key(ct) do
    0..255 |> Enum.max_by(fn k -> ct |> Bytes.xor_cycled(<<k>>) |> English.score end)
  end

  defp encrypt_aes(pt, key) when byte_size(pt) == 16 do
    iv = <<0>> |> :binary.copy 16
    :crypto.block_encrypt :aes_cbc128, key, iv, pt
  end

  defp decrypt_aes(ct, key) when byte_size(ct) == 16 do
    iv = <<0>> |> :binary.copy 16
    :crypto.block_decrypt :aes_cbc128, key, iv, ct
  end

  def decrypt_aes_ecb(ct, key) do
    s  = byte_size ct
    pt = ct
    |> Bytes.chunk(16)
    |> Enum.map(fn ct -> ct |> decrypt_aes key end)
    |> Bytes.join
    pt |> :binary.part { 0, s - :binary.at(pt, s - 1) } 
  end

  defp aes_ecb?("", _), do: false
  defp aes_ecb?(<<block :: binary-size(16), rest :: binary>>, found) do
    if found |> Set.member? block do
      true
    else
      aes_ecb? rest, found |> Set.put block
    end
  end
  def aes_ecb?(ct) when rem(byte_size(ct), 16) != 0, do: false
  def aes_ecb?(ct), do: aes_ecb?(ct, HashSet.new)

  def pad_pkcs7(pt, l) do
    n = l - rem(byte_size(pt), l)
    pt <> :binary.copy(<<n>>, n) 
  end

  def unpad_pkcs7(pt) do
    s = byte_size pt
    pt |> :binary.part { 0, s - :binary.at(pt, s - 1) }
  end

  defp encrypt_aes_cbc128("", _, _, acc), do: acc
  defp encrypt_aes_cbc128(<<pt :: binary-size(16), rest :: binary>>, key, prev, acc \\ "") do
    ct = Bytes.xor(prev, pt) |> encrypt_aes key
    encrypt_aes_cbc128(rest, key, ct, acc <> ct)    
  end
  
  defp decrypt_aes_cbc128("", _, _, acc), do: acc |> unpad_pkcs7
  defp decrypt_aes_cbc128(<<ct :: binary-size(16), rest :: binary>>, key, prev, acc \\ "") do
    pt = ct |> decrypt_aes(key) |> Bytes.xor(prev)
    decrypt_aes_cbc128(rest, key, ct, acc <> pt)    
  end
  
  def encrypt(pt, :aes_cbc128, key, iv), do: encrypt_aes_cbc128(pt, key, iv)
  def decrypt(ct, :aes_cbc128, key, iv), do: decrypt_aes_cbc128(ct, key, iv)

end
