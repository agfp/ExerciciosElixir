defmodule DependenciasTransitivasTest do
  import DependenciasTransitivas
  use ExUnit.Case

  test "Trivial 1" do
    entrada = %{a: MapSet.new([:b, :c])}
    assert mostra_dependencias(entrada) == entrada
  end

  test "Trivial 2" do
    entrada = %{
        a: MapSet.new([:b, :c]),
        d: MapSet.new([:e, :f])
    }
    assert mostra_dependencias(entrada) == entrada
  end

  test "Um nivel de dependencia" do
    entrada = %{
        a: MapSet.new([:b, :c]),
        b: MapSet.new([:c, :e])
    }
    assert mostra_dependencias(entrada) == %{
      a: MapSet.new([:b, :c, :e]),
      b: MapSet.new([:c, :e])
    }
  end

  test "Dois niveis de dependencia" do
    entrada = %{
        a: MapSet.new([:b, :c]),
        b: MapSet.new([:c, :e]),
        e: MapSet.new([:f, :g])
    }
    assert mostra_dependencias(entrada) == %{
      a: MapSet.new([:b, :c, :e, :f, :g]),
      b: MapSet.new([:c, :e, :f, :g]),
      e: MapSet.new([:f, :g])
    }
  end

  test "Teste do exemplo" do
    entrada = %{
        a: MapSet.new([:b, :c]),
        b: MapSet.new([:c, :e]),
        c: MapSet.new([:g]),
        d: MapSet.new([:a, :f]),
        e: MapSet.new([:f]),
        f: MapSet.new([:h])
    }
    assert mostra_dependencias(entrada) == %{
      a: MapSet.new([:b, :c, :e, :f, :g, :h]),
      b: MapSet.new([:c, :e, :f, :g, :h]),
      c: MapSet.new([:g]),
      d: MapSet.new([:a, :b, :c, :e, :f, :g, :h]),
      e: MapSet.new([:f, :h]),
      f: MapSet.new([:h])
    }
  end
end
