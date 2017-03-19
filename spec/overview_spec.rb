class Calculator
  attr_reader :digits

  def initialize(digits_string)
    @digits = parse_input(digits_string)
  end

  def sum
    digits.inject(:+)
  end

  def multiply
    digits.inject(:*)
  end

  private

  def parse_input(str)
    str.split(',').map { |n| n.to_i}
  end
end

describe Calculator do
  it 'sums provided digits' do
    calc = Calculator.new('1,2,3,4,5')
    expect(calc.sum).to eq(15)
  end

  it 'multiplies provided digits' do
    calc = Calculator.new('4,5')
    expect(calc.multiply).to eq(20)
  end
end
