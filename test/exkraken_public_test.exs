defmodule ExkrakenPublicTest do
  @moduledoc false
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "get_server_time" do
    use_cassette "get_server_time_default" do
      {:ok, server_time} = Exkraken.Public.get_server_time
      assert server_time == DateTime.from_unix!(1_502_626_499)
    end
  end

  test "get_asset_info" do
    use_cassette "get_asset_info_default" do
      {:ok, asset_info} = Exkraken.Public.get_asset_info
      assert asset_info["XXBT"]
      assert asset_info["ZEUR"]
      assert asset_info["XETH"]
      assert asset_info["ZUSD"]
    end
  end

  test "get_asset_info(%{asset: [...]})" do
    use_cassette "get_asset_info_filtered" do
      {:ok, asset_info} = Exkraken.Public.get_asset_info(%{asset: ["BTC", "EUR"]})
      assert Map.keys(asset_info) == ["XXBT", "ZEUR"]
    end
  end

  test "get_tradable_asset_pairs" do
    use_cassette "get_tradable_asset_pairs_default" do
      {:ok, tradable_asset_pairs} = Exkraken.Public.get_tradable_asset_pairs
      assert tradable_asset_pairs["XXBTZEUR"]
      assert tradable_asset_pairs["XETHZUSD"]
    end
  end

  test "get_tradable_asset_pairs(%{pair: [...]})" do
    use_cassette "get_tradable_asset_pairs_filtered" do
      {:ok, tradable_asset_pairs} = Exkraken.Public.get_tradable_asset_pairs(%{pair: ["XETHZUSD", "XXBTZEUR"]})
      assert MapSet.new(Map.keys(tradable_asset_pairs)) == MapSet.new(["XXBTZEUR", "XETHZUSD"])
    end
  end

  test "get_ticker_information(%{pair: [...]})" do
    use_cassette "get_ticker_information" do
      {:ok, ticker_information} = Exkraken.Public.get_ticker_information(%{pair: ["XETHZUSD", "XXBTZEUR"]})
      assert MapSet.new(Map.keys(ticker_information)) == MapSet.new(["XXBTZEUR", "XETHZUSD"])
    end
  end

end
