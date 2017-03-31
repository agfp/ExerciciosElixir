defmodule DependenciasTransitivas do

  def dependencias(entrada) do
    Map.keys(entrada)
    |> Enum.map(fn(key) -> %{key => loop(entrada[key], entrada)} end)
    |> Enum.reduce(fn(a, b) -> Map.merge(a, b) end)
  end

  defp loop(nil, _), do: []
  defp loop(lista, entrada) do
    MapSet.union(lista, MapSet.new(Enum.flat_map(lista, fn(item) -> loop(entrada[item], entrada) end)))
  end

end
