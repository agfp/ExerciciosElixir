defmodule NumerosFelizesTest do
  use ExUnit.Case
  import NumerosFelizes

  test "1" do
    assert feliz?(1) == true
  end

  test "10" do
    assert feliz?(10) == true
  end

  test "49" do
    assert feliz?(49) == true
  end

  test "97" do
    assert feliz?(97) == true
  end

  test "130" do
    assert feliz?(130) == true
  end

  test "99" do
    assert feliz?(98) == false
  end

  test "11" do
    assert feliz?(11) == false
  end

  test "48" do
    assert feliz?(48) == false
  end

  test "96" do
    assert feliz?(96) == false
  end

  test "132" do
    assert feliz?(132) == false
  end
end
