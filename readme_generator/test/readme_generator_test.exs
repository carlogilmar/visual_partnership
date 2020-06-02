defmodule ReadmeGeneratorTest do
  use ExUnit.Case
  doctest ReadmeGenerator

  test "greets the world" do
    assert ReadmeGenerator.hello() == :world
  end
end
