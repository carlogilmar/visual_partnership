defmodule ReadmeGenerator do
  alias ReadmeGenerator.{ContentBuilder, BuilderMD, TableBuilder}

  def do_it do
    readme = ContentBuilder.get_readme()
    table = TableBuilder.get_gallery_table(readme.gallery)
    params = [logo: readme.logo, about_it: readme.about_it, support: readme.support, table: table]
    BuilderMD.create_readme(params)
  end

end

