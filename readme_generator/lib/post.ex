defmodule ReadmeGenerator.Publish do
  @moduledoc """
    Simple module to send blog post to Dev.To
  """
  alias ReadmeGenerator.DevTo

  def post_dev_to do
    {path, 0} = System.cmd("pwd", [])
    [dir, _] = String.split(path, "readme_generator")
    {res, 0} = System.cmd("ls", ["#{dir}to_publish"])
    ["" | posts] = res |> String.split("\n") |> Enum.reverse()
    %{dir: dir, posts: posts} |> publish()
  end

  def publish(%{dir: dir, posts: posts}) do
    Enum.each(posts, fn post ->
      {:ok, content} = File.read("#{dir}to_publish/#{post}")
      status_code = DevTo.publish("Review this new blog post!", content)
      case status_code do
        201 -> move_file(dir, post)
        _ -> raise "Ocurrió un gran error"
      end
    end)
  end

  def move_file(dir, post) do
    System.cmd("mv", ["#{dir}to_publish/#{post}", "#{dir}graphic_recordings"])
  end

end
