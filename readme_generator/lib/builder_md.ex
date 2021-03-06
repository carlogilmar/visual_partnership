defmodule ReadmeGenerator.BuilderMD do

  defp get_template_content() do
    file_path = Application.app_dir(:readme_generator, "priv/readme.md")
    {:ok, content} = File.read(file_path)
    content
  end

  defp write_md_file(md_content) do
    {path, 0} = System.cmd "pwd", []
    [dir, _] = String.split(path, "readme_generator")
    {:ok, file} = File.open("#{dir}README.md", [:write])
    IO.binwrite(file, md_content)
    :ok = File.close(file)
    :created
  end

  def create_readme(params) do
    get_template_content()
    |> EEx.eval_string(params)
    |> write_md_file()
  end

end
