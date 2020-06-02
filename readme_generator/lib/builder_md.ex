defmodule ReadmeGenerator.BuilderMD do

  def get_template_content() do
    file_path = Application.app_dir(:readme_generator, "priv/readme.md")
    {:ok, content} = File.read(file_path)
    content
  end

  def write_md_file(md_content) do
    {:ok, file} = File.open("README.md", [:write])
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
