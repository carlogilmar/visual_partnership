defmodule Mix.Tasks.Generator do
  use Mix.Task

  def run(_) do
    :created = ReadmeGenerator.do_it()
    IO.puts "Readme generado..."
  end
end
