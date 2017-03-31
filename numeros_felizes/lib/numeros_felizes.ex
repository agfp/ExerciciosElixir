defmodule NumerosFelizes do

  def feliz?(numero) do
    feliz?(numero, [])
  end

  defp feliz?(numero, caminho) do
    cond do
        Enum.any?(caminho, fn(x) -> x == numero end) ->
          false

        true ->
          case soma_quadrados(numero) do
            1 -> true
            x -> feliz?(x, caminho ++ [numero])
          end
    end
  end

  defp soma_quadrados(numero) do
      numero
      |> Integer.to_charlist()
      |> Enum.map(fn(n) -> trunc :math.pow(List.to_integer([n]), 2) end)
      |> Enum.reduce(fn(x, acc) -> x + acc end)
  end

end
