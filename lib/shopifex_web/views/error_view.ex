if Version.compare(Application.spec(:phoenix_html, :vsn) |> to_string(), "4.0.0") == :lt do
  defmodule ShopifexWeb.ErrorView do
    use ShopifexWeb, :view_legacy

    # If you want to customize a particular status code
    # for a certain format, you may uncomment below.
    # def render("500.html", _assigns) do
    #   "Internal Server Error"
    # end

    # By default, Phoenix returns the status message from
    # the template name. For example, "404.html" becomes
    # "Not Found".
    def template_not_found(template, _assigns) do
      Phoenix.Controller.status_message_from_template(template)
    end
  end
else
  defmodule ShopifexWeb.ErrorView do
    use ShopifexWeb, :view

    # If you want to customize a particular status code
    # for a certain format, you may uncomment below.
    # def render("500.html", _assigns) do
    #   "Internal Server Error"
    # end

    # By default, Phoenix returns the status message from
    # the template name. For example, "404.html" becomes
    # "Not Found".
    def template_not_found(template, _assigns) do
      Phoenix.Controller.status_message_from_template(template)
    end
  end
end
