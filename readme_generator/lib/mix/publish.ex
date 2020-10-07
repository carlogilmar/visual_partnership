defmodule Mix.Tasks.Publish do
  use Mix.Task

  def run(_) do
    ReadmeGenerator.Publish.post_dev_to()
    IO.puts "Dev To Post Published!..."
  end
end
