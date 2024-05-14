if Version.compare(Application.spec(:phoenix_html, :vsn) |> to_string(), "4.0.0") == :lt do
  defmodule ShopifexWeb.GrantView do
    use ShopifexWeb, :view_legacy
  end
else
  defmodule ShopifexWeb.GrantView do
    use ShopifexWeb, :view
  end
end
