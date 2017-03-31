defmodule ChequePorExtenso do

  require IEx

  @numeros_especiais %{
    1 => "um",
    2 => "dois",
    3 => "tres",
    4 => "quatro",
    5 => "cinco",
    6 => "seis",
    7 => "sete",
    8 => "oito",
    9 => "nove",
    10 => "dez",
    11 => "onze",
    12 => "doze",
    13 => "treze",
    14 => "quatorze",
    15 => "quinze",
    16 => "dezesseis",
    17 => "dezessete",
    18 => "dezoito",
    19 => "dezenove",
    100 => "cem",
    1000 => "mil"
  }

  @extenso %{
    20 => "vinte",
    30 => "trinta",
    40 => "quarenta",
    50 => "cinquenta",
    60 => "sessenta",
    70 => "setenta",
    80 => "oitenta",
    90 => "noventa",
    100 => "cento",
    200 => "duzentos",
    300 => "trezentos",
    400 => "quatrocentos",
    500 => "quinhentos",
    600 => "seiscentos",
    700 => "setecentos",
    800 => "oitocentos",
    900 => "novecentos"
  }

  @multiplicadores %{
    1.0e3 => "mil",
    1.0e6 => "milhao",
    1.0e9 => "bilhao",
    1.0e12 => "trilhao"
  }

  defp por_extenso(referencias, value) do
    if not is_nil(numero = Enum.find(@especiais, fn {x, _} -> x == value end)) do
      elem(numero, 1)  
    else 
      numero = Enum.find(referencias, fn {x, _} -> x <= value end)
      resto = value - elem(numero, 0)
      case resto do
        0 -> elem(numero, 1)
        _ -> elem(numero, 1) <> " e " <> por_extenso(referencias, resto)
      end
    end
  end

  defp pega_reais(referencias, reais) when reais == 0, 
  do: {referencias, ""}
  defp pega_reais(referencias, reais) do
    


    
    milhar = trunc(reais/1.0e3)
    {referencias, por_extenso(referencias, milhar) <> " mil, " <> por_extenso(referencias, trunc(reais) - (milhar*1.0e3)) <> " reais"}
  end
  defp pega_reais(referencias, reais) do
    {referencias, por_extenso(referencias, trunc(reais)) <> " reais"}
  end

  defp pega_centavos({_, reais_extenso}, centavos) when centavos == 0,
  do: reais_extenso <> ""
  defp pega_centavos({referencias, reais_extenso}, centavos),
  do: reais_extenso <> " e " <> por_extenso(referencias, centavos) <> " centavos"


  def write(value) do
    reais = trunc value
    centavos = trunc(value - reais) * 100

    referencias = %{
      :extenso => Enum.sort(@extenso, &(&1 >= &2)),
      :multiplicadores => Enum.sort(@multiplicadores, &(&1 >= &2))
    }
    |> pega_reais(reais)
    |> pega_centavos(centavos)
  end
end
