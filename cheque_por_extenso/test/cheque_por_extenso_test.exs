defmodule ChequePorExtensoTest do
	use ExUnit.Case

	# test "1" do
	# 	assert ChequePorExtenso.write(1) == "um real"
	# end

	test "5" do
		assert ChequePorExtenso.write(5) == "cinco reais"
	end

	test "55" do
		assert ChequePorExtenso.write(55) == "cinquenta e cinco reais"
	end

	test "555" do
		assert ChequePorExtenso.write(555) == "quinhentos e cinquenta e cinco reais"
	end

	test "5555" do
		assert ChequePorExtenso.write(5555) == "cinco mil, quinhentos e cinquenta e cinco reais"
	end

	# test "10" do
	# 	assert ChequePorExtenso.write(10) == "dez reais"
	# end

	# test "12" do
	# 	assert ChequePorExtenso.write(12) == "doze reais"
	# end

	# test "17" do
	# 	assert ChequePorExtenso.write(17) == "dezessete reais"
	# end

	# test "20" do
	# 	assert ChequePorExtenso.write(20) == "vinte reais"
	# end

	# test "26" do
	# 	assert ChequePorExtenso.write(26) == "vinte e seis reais"
	# end

	# test "37" do
	# 	assert ChequePorExtenso.write(37) == "trinta e sete reais"
	# end

	# test "93" do
	# 	assert ChequePorExtenso.write(93) == "noventa e tres reais"
	# end

	# test "100" do
	# 	assert ChequePorExtenso.write(100) == "cem reais"
	# end

	# test("28,72") do
	# 	assert ChequePorExtenso.write(28.754) == "vinte e oito reais e setenta e cinco centavos"
	# end

	# test "101" do
	# 	assert ChequePorExtenso.write(101) == "cento e um reais"
	# end

	# test "1000" do
	# 	assert ChequePorExtenso.write(1000) == "mil reais"
	# end

	# test "1001" do
	# 	assert ChequePorExtenso.write(1001) == "mil e um reais"
	# end

	# test "1572" do
	# 	assert ChequePorExtenso.write(1001) == "mil, quinhentos e setenta e dois reais"
	# end

	# test "6324" do
	# 	assert ChequePorExtenso.write(6324) == "seis mil, trezentos e vinte e quatro reais"
	# end

	# test "10000" do
	# 	assert ChequePorExtenso.write(10000) == "dez mil reais"
	# end

	# test "12020" do
	# 	assert ChequePorExtenso.write(12020) == "doze mil e vinte reais"
	# end

	# test "99999" do
	# 	assert ChequePorExtenso.write(99999) == "noventa e nove mil, novecentos e noventa e nove reais"
	# end

	# test "100000" do
	# 	assert ChequePorExtenso.write(100000) == "cem mil reais"
	# end
	
	# test "150972" do
	# 	assert ChequePorExtenso.write(100000) == "cento e cinquenta mil, novecentos e setenta e dois reais"
	# end


end
