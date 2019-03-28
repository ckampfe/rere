defmodule RereWeb.RereLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  def render(assigns) do
    ~L"""
    <form phx-change="parse" style="display: inline;">
      <input style="float: left;" type="text" name="regex" value="<%= @regex %>" placeholder="Regex..." />
      <input style="float: right;" type="text" name="input" value="<%= @input %>" placeholder="Input..." />
    </form>
    <%= Phoenix.HTML.raw @result %>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, regex: nil, input: nil, result: "")}
  end

  def handle_event("parse", %{"regex" => regex, "input" => input} = q, socket) do
    case Regex.compile(regex) do
      {:ok, compiled} ->
        result =
          Regex.replace(compiled, input, "<span style=\"background-color: #FFFF00\">\\0</span>")

        {:noreply, assign(socket, regex: regex, input: input, result: result)}

      _ ->
        {:noreply, socket}
    end
  end
end
