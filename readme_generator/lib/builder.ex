defmodule ReadmeGenerator.ContentBuilder do
  @yaml_file "readme.yml"
  alias ReadmeGenerator.Models.{Item, Readme}

  def get_readme do
    path = get_yml_path()
    path |> get_struct_from_yaml()
  end

  defp get_yml_path do
    {path, 0} = System.cmd "pwd", []
    [url, _] = String.split(path, "readme_generator")
    "#{url}#{@yaml_file}"
  end

  defp get_struct_from_yaml(yaml) do
    {:ok, content} = yaml |> YamlElixir.read_from_file()
    content_map = Enum.into(content, %{}, fn {k,v} -> {String.to_atom(k),v} end)
    gallery_items= Enum.into(content_map.gallery, [], fn item -> get_item(item) end)
    readme = struct(%Readme{}, content_map)
    %{readme | gallery: gallery_items}
  end

  defp get_item(item) do
    item_map = Enum.into(item, %{}, fn {k,v} -> {String.to_atom(k),v} end)
    struct(%Item{}, item_map)
  end

end
