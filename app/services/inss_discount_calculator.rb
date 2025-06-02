class InssDiscountCalculator
  FAIXAS_2025 = [
    { faixa_max: 1412.0, aliquota: 0.075 },
    { faixa_max: 2666.68, aliquota: 0.09 },
    { faixa_max: 4000.03, aliquota: 0.12 },
    { faixa_max: 7786.02, aliquota: 0.14 }
  ]

  def self.call(salario)
    salario = salario.to_f
    desconto = 0.0
    faixa_anterior = 0.0

    FAIXAS_2025.each do |faixa|
      if salario > faixa[:faixa_max]
        base = faixa[:faixa_max] - faixa_anterior
      else
        base = salario - faixa_anterior
      end

      break if base <= 0

      desconto += base * faixa[:aliquota]
      faixa_anterior = faixa[:faixa_max]
    end

    desconto.round(2)
  end
end
