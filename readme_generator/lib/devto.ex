defmodule ReadmeGenerator.DevTo do
  @moduledoc """
    Simple module to send blog post to Dev.To
  """
  defstruct [:body_markdown, :published, :title]

  def publish(title, body) do
    {title, body}
    |> create_request()
    |> post()
  end

  defp create_request({title, body}) do
    blog_post =
      %__MODULE__{
        title: title,
        published: false,
        body_markdown: body
      }
      |> Map.from_struct()

    Poison.encode!(%{article: blog_post})
  end

  defp post(body) do
    api_key = get_dev_to_api()
    headers = [{"api-key", api_key}, {"Content-type", "application/json"}]
    url = "https://dev.to/api/articles"
    {:ok, response} = HTTPoison.post(url, body, headers)
    response.status_code
  end

  defp get_dev_to_api do
    System.get_env("DEVTO_API_KEY")
  end
end
