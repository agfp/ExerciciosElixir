defmodule DependenciasTransitivas do

  def dependencias(entrada) do
    Map.keys(entrada)
    |> Enum.map(fn(key) -> pesquisa_dependencias(key, entrada) end)
    |> Enum.reduce(fn(a, b) -> Map.merge(a, b) end)
  end

  defp pesquisa_dependencias(key, entrada) do
    deps =
      loop(entrada[key], entrada)
      |> List.flatten
      |> Enum.uniq
      |> Enum.sort

    %{key => deps}
  end

  defp loop(nil, _), do: []
  defp loop(lista, entrada) do
    lista ++ Enum.map(lista, fn(item) -> loop(entrada[item], entrada) end)
  end
end
