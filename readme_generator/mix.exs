defmodule ReadmeGenerator.MixProject do
  use Mix.Project

  def project do
    [
      app: :readme_generator,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:yaml_elixir, "~> 2.4"},
      {:httpoison, "~> 1.6"},
      {:poison, "~> 3.1"}
    ]
  end
end
