if Version.compare(Application.spec(:phoenix_html, :vsn) |> to_string(), "4.0.0") == :lt do
  defmodule ShopifexWeb.PageView do
    use ShopifexWeb, :view_legacy

    def shop_url(%Plug.Conn{} = conn) do
      conn
      |> Shopifex.Plug.current_shop()
      |> Shopifex.Shops.get_url()
    end
  end
else
  defmodule ShopifexWeb.PageView do
    use ShopifexWeb, :view

    def shop_url(%Plug.Conn{} = conn) do
      conn
      |> Shopifex.Plug.current_shop()
      |> Shopifex.Shops.get_url()
    end
  end
end
