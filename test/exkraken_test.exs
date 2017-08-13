defmodule ExkrakenTest do
  use ExUnit.Case
  doctest Exkraken

  test "greets the world" do
    assert Exkraken.hello() == :world
  end
end
