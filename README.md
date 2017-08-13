# Exkraken

Elixir client for the kraken.com API. **Work in Progress**

[Documentation](https://hexdocs.pm/exkraken)

## Installation

The package can be installed by adding `exkraken` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exkraken, "~> 0.1.0"}
  ]
end
```

Add `exkraken` to your applications list if your Elixir version is 1.3 or lower:

```elixir
def application do
  [applications: [:exkraken]]
end
```

## Implementation Progress

### Public market data

[x] Get server time   
[x] Get asset info   
[x] Get tradable asset pairs   
[x] Get ticker information   
[ ] Get OHLC data   
[ ] Get order book   
[ ] Get recent trades   
[ ] Get recent spread data   

### Private user data

Nothing yet.
