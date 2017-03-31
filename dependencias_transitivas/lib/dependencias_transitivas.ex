defmodule DependenciasTransitivas do

  def dependencias(entrada) do
    Map.keys(entrada)
    |> Enum.map(fn(key) -> %{key => loop(entrada[key], entrada)} end)
    |> Enum.reduce(fn(a, b) -> Map.merge(a, b) end)
  end

  defp loop(nil, _), do: []
  defp loop(deps, entrada) do
    subdeps = Enum.flat_map(deps, fn(key) -> loop(entrada[key], entrada) end)
    MapSet.union(deps, MapSet.new(subdeps))
  end

end
