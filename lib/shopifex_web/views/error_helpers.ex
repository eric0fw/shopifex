if Version.compare(Application.spec(:phoenix_html, :vsn) |> to_string(), "4.0.0") == :lt do
  defmodule ShopifexWeb.ErrorHelpers do
    use Phoenix.HTML

    @moduledoc """
    Conveniences for translating and building error messages.
    """

    @doc """
    Generates tag for inlined form input errors.
    """
    def error_tag(form, field) do
      Enum.map(Keyword.get_values(form.errors, field), fn error ->
        content_tag(:span, translate_error(error),
          class: "invalid-feedback",
          phx_feedback_for: input_id(form, field)
        )
      end)
    end

    @doc """
    Translates an error message using gettext.
    """
    def translate_error({msg, opts}) do
      if count = opts[:count] do
        Gettext.dngettext(ShopifexWeb.Gettext, "errors", msg, msg, count, opts)
      else
        Gettext.dgettext(ShopifexWeb.Gettext, "errors", msg, opts)
      end
    end
  end
else
  defmodule ShopifexWeb.ErrorHelpers do
    import Phoenix.HTML.Form
    use PhoenixHTMLHelpers

    @moduledoc """
    Conveniences for translating and building error messages.
    """

    @doc """
    Generates tag for inlined form input errors.
    """
    def error_tag(form, field) do
      Enum.map(Keyword.get_values(form.errors, field), fn error ->
        content_tag(:span, translate_error(error),
          class: "invalid-feedback",
          phx_feedback_for: input_id(form, field)
        )
      end)
    end

    @doc """
    Translates an error message using gettext.
    """
    def translate_error({msg, opts}) do
      if count = opts[:count] do
        Gettext.dngettext(ShopifexWeb.Gettext, "errors", msg, msg, count, opts)
      else
        Gettext.dgettext(ShopifexWeb.Gettext, "errors", msg, opts)
      end
    end
  end
end
