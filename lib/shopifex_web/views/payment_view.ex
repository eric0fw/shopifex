if Version.compare(Application.spec(:phoenix_html, :vsn) |> to_string(), "4.0.0") == :lt do
  defmodule ShopifexWeb.PaymentView do
    use ShopifexWeb, :view_legacy

    def available_plans(shop, guard) do
      shop
      |> payment_guard().list_available_plans_for_guard(guard)
      |> Enum.map(fn guard ->
        Map.take(guard, [:id, :features, :grants, :name, :price, :type, :usages])
      end)
      |> Jason.encode!()
    end

    def shop_url(%Plug.Conn{} = conn) do
      conn
      |> Shopifex.Plug.current_shop()
      |> Shopifex.Shops.get_url()
    end

    def payment_guard, do: Application.get_env(:shopifex, :payment_guard)
  end
else
  defmodule ShopifexWeb.PaymentView do
    use ShopifexWeb, :view

    def available_plans(shop, guard) do
      shop
      |> payment_guard().list_available_plans_for_guard(guard)
      |> Enum.map(fn guard ->
        Map.take(guard, [:id, :features, :grants, :name, :price, :type, :usages])
      end)
      |> Jason.encode!()
    end

    def shop_url(%Plug.Conn{} = conn) do
      conn
      |> Shopifex.Plug.current_shop()
      |> Shopifex.Shops.get_url()
    end

    def payment_guard, do: Application.get_env(:shopifex, :payment_guard)
  end
end
