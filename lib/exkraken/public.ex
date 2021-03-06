defmodule Exkraken.Public do
  @moduledoc """
  Public API methods
  """

  defp process_url(url) do
    Application.get_env(:exkraken, :endpoint) <> url
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp get_result(url) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.Base.get(url)
    {:ok, Map.get(body, "result")}
  end

  @doc """
  Get server time

  URL: https://api.kraken.com/0/public/Time

  ## Examples

      iex> Exkraken.Public.get_server_time
      {:ok, #DateTime<2017-08-13 11:15:13Z>}

  """
  def get_server_time do
    {:ok, result} = get_result("/0/public/Time")

    result
    |> Map.get("unixtime")
    |> DateTime.from_unix
  end

  @doc """
  Get asset info

  URL: https://api.kraken.com/0/public/Assets

  ## Examples

      iex> Exkraken.Public.get_asset_info(%{asset: ["XXBT", "ZEUR"]})
      {:ok, %{"XXBT" => %{...}, ...}}
  """
  def get_asset_info(%{asset: asset_list}) do
    get_result("/0/public/Assets?" <> URI.encode_query(asset: Enum.join(asset_list, ",")))
  end
  def get_asset_info do
    get_result("/0/public/Assets")
  end

  @doc """
  Get tradable asset pairs

  URL: https://api.kraken.com/0/public/AssetPairs

  ## Examples

      iex> Exkraken.Public.get_tradable_asset_pairs(%{pair: ["XXBTZEUR"]})
      {:ok, %{"XXBTZEUR" => %{...}}}
  """
  def get_tradable_asset_pairs(%{pair: pair_list}) do
    get_result("/0/public/AssetPairs?" <> URI.encode_query(pair: Enum.join(pair_list, ",")))
  end
  def get_tradable_asset_pairs do
    get_result("/0/public/AssetPairs")
  end

  @doc """
  Get ticker information

  URL: https://api.kraken.com/0/public/Ticker

  ## Examples

      iex> Exkraken.Public.get_ticker_information(%{pair: ["XXBTZEUR"]})
      {:ok, %{"XXBTZEUR" => %{...}}}
  """
  def get_ticker_information(%{pair: pair_list}) do
    get_result("/0/public/Ticker?" <> URI.encode_query(pair: Enum.join(pair_list, ",")))
  end
end
