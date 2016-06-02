defmodule Ratchet.Phoenix.EngineTest do
  use ExUnit.Case, async: true

  alias Ratchet.Phoenix.Engine
  alias Phoenix.View

  doctest Engine

  defmodule TestView do
    use Phoenix.Template, root: "test/fixtures/templates"
  end

  test "render a ratchet template" do
    data = %{post: %{title: {"OHAI", class: "large"}, body: "COOL"}}
    result = View.render(TestView, "posts.html", data: data) |> Phoenix.HTML.safe_to_string

    assert result == ~S(<section><article data-prop="post"><h1 class="large" data-prop="title">OHAI</h1><p data-prop="body">COOL</p></article></section>)
  end
end
