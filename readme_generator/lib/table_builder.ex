defmodule ReadmeGenerator.TableBuilder do

  def get_gallery_table(items) do
    for item <- items, reduce: "" do
      acc ->
      tags = create_tags(item.tags)
      row = create_row(item, tags)
      "#{acc} #{row}"
    end
  end

  defp create_tags(tags) do
    tags_quoted = Enum.into(tags, [], fn tag -> "`#{tag}`" end)
    Enum.join(tags_quoted, ", ")
  end

  defp create_row(item, tags) do
    """
| [ #{item.title} <br/><img src="#{item.cover_img}" width="35%"/><br/>Created: #{item.date_created}](#{item.gallery_url}) | #{item.description} </br> #{tags} |
"""
  end

end
