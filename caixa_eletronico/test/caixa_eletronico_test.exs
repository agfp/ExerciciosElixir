defmodule CaixaEletronicoTest do
  use ExUnit.Case
  doctest CaixaEletronico

  test "Sacar 30" do
    assert CaixaEletronico.saque(30) == [{20, 1}, {10, 1}]
  end

  test "Sacar 40" do
    assert CaixaEletronico.saque(40) == [{20, 2}]
  end

  test "Sacar 80" do
    assert CaixaEletronico.saque(80) == [{50, 1}, {20, 1}, {10, 1}]
  end

  test "Sacar 590" do
    assert CaixaEletronico.saque(590) == [{100, 5}, {50, 1}, {20, 2}]
  end
end
