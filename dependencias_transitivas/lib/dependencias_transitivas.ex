defmodule DependenciasTransitivas do

  def mostra_dependencias(entrada) do
    entrada
    |> Map.keys()
    |> Enum.map(fn(key) -> %{key => loop(entrada[key], entrada)} end)
    |> Enum.reduce(fn(a, b) -> Map.merge(a, b) end)
  end

  defp loop(nil, _), do: []
  defp loop(dependencias, entrada) do
    dependencias
    |> Enum.flat_map(fn(key) -> loop(entrada[key], entrada) end)
    |> MapSet.new()
    |> MapSet.union(dependencias)
  end

end
