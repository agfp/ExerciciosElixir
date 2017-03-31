defmodule DependenciasTransitivasTest do
  import DependenciasTransitivas
  use ExUnit.Case

  test "Trivial 1" do
    entrada = %{a: [:b, :c]}
    assert dependencias(entrada) == entrada
  end

  test "Trivial 2" do
    entrada = %{
        a: [:b, :c],
        d: [:e, :f]
    }
    assert dependencias(entrada) == entrada
  end

  test "Um nivel de dependencia" do
    entrada = %{
        a: [:b, :c],
        b: [:c, :e]
    }
    assert dependencias(entrada) == %{
      a: [:b, :c, :e],
      b: [:c, :e]
    }
  end

  test "Dois niveis de dependencia" do
    entrada = %{
        a: [:b, :c],
        b: [:c, :e],
        e: [:f, :g]
    }
    assert dependencias(entrada) == %{
      a: [:b, :c, :e, :f, :g],
      b: [:c, :e, :f, :g],
      e: [:f, :g]
    }
  end

  test "Teste do exemplo" do
    entrada = %{
        a: [:b, :c],
        b: [:c, :e],
        c: [:g],
        d: [:a, :f],
        e: [:f],
        f: [:h]
    }
    assert dependencias(entrada) == %{
      a: [:b, :c, :e, :f, :g, :h],
      b: [:c, :e, :f, :g, :h],
      c: [:g],
      d: [:a, :b, :c, :e, :f, :g, :h],
      e: [:f, :h],
      f: [:h]
    }
  end
end
