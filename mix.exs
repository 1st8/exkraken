defmodule Exkraken.Mixfile do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :exkraken,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: [
        maintainers: ["1st8"],
        licenses: ["MIT"],
        links: %{github: "https://github.com/1st8/exkraken"}
      ],
      description: """
      Elixir client for the kraken.com API
      """,

      # Docs
      name: "Exkraken",
      source_url: "https://github.com/1st8/exkraken",
      docs: [
        main: "Exkraken", # The main page in the docs
        # logo: "path/to/logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:httpoison, "~> 0.12"},
      {:poison, "~> 3.1"},
      {:exvcr, "~> 0.8", only: :test},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
end
