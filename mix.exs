defmodule ExAws.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_aws,
     version: "0.0.4",
     elixir: "~> 1.0",
     description: "AWS client. Currently supports Dynamo, Kinesis, Lambda, S3",
     package: package,
     deps: deps]
  end

  def application do
    Mix.env |> application
  end

  def application(:dev) do
    [applications: [:logger, :httpoison]]
  end

  def application(_) do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:aws_auth, github: "benwilson512/aws_auth"},
      {:sweet_xml, "~> 0.2.1"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.7", only: :dev} |
      deps(:test_dev)
    ]
  end

  defp deps(:test_dev) do
    [
      {:httpoison, "~> 0.6.0", only: [:test, :dev]},
      {:poison, "~> 1.2.0", only: [:test, :dev]},
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.1", only: :test},
      {:httpotion, "~> 2.0.0", only: :test},
      {:jsx, "~> 2.5.2", only: :test}
    ]
  end

  defp package do
    [description: "AWS client. Currently supports Dynamo, Kinesis, Lambda, S3",
     files: ["lib", "config", "mix.exs", "README*"],
     contributors: ["Ben Wilson"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/CargoSense/ex_aws"}]
  end
end
