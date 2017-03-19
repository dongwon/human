class Calculator
  def self.add(x, y)
    x + y
  end
end

describe 'and_call_original' do
  it 'responds as it normally would' do
    expect(Calculator).to receive(:add).and_call_original
    expect(Calculator.add(2,3)).to eq(5)
  end
end

describe 'and_call_original' do
  it 'can be overriden for specific arguments using #with' do
    allow(Calculator).to receive(:add).and_call_original
    allow(Calculator).to receive(:add).with(2, 3).and_return(-5)

    expect(Calculator.add(2, 2)).to eq(4)
    expect(Calculator.add(2, 10)).to eq(12)
    expect(Calculator.add(2, 3)).to eq(-5)
  end
end
