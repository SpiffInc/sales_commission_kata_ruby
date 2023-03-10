require_relative '../lib/sales_commission_calculator'

RSpec.describe SalesCommissionCalculator do
  let(:sales_representatives) do
    [
      SalesRepresentative.new(5_000),
      SalesRepresentative.new(15_000),
      SalesRepresentative.new(25_000)
    ]
  end

  context 'when total sales is less than 100,000' do
    let(:calculator) { SalesCommissionCalculator.new(50_000, sales_representatives) }

    it 'calculates the correct commission for each sales representative' do
      calculator.calculate_commissions
      expect(sales_representatives[0].commission).to eq(250.0)
      expect(sales_representatives[1].commission).to eq(1_500.0)
      expect(sales_representatives[2].commission).to eq(2_500.0)
    end
  end
end
