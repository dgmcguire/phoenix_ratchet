defmodule Ratchet.Plug.Data do
  @moduledoc "TODO"

  @behaviour Plug

  def init(_opts), do: false

  @doc """
  Initialize connection data

      iex> conn = %Plug.Conn{}
      iex> Data.call(conn, [])
      %Plug.Conn{assigns: %{data: %{}}}
  """
  def call(conn, _opts) do
    update_in conn.assigns, &Map.put(&1, :data, %{})
  end

  @doc """
  Merge new data into existing

      iex> conn = %Plug.Conn{assigns: %{data: %{foo: "bar"}}}
      iex> Data.merge(conn, %{baz: "qux"})
      %Plug.Conn{assigns: %{data: %{foo: "bar", baz: "qux"}}}
  """
  def merge(conn, data) do
    update_in conn.assigns.data, &Map.merge(&1, data)
  end
end
