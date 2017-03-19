describe 'The default response' do
  it 'returns nil when no response has been configured' do
    dbl = double
    allow(dbl).to receive(:foo)
    expect(dbl.foo).to be_nil
  end
end

describe 'Specifying a return value' do
  it 'returns the specified return value' do
    dbl = double
    allow(dbl).to receive(:foo).and_return(14)
    expect(dbl.foo).to eq(14)
  end
end

describe 'When the method is called multiple times' do
  it 'returns the specified values in order, then keeps returning the last value' do
    dbl = double
    allow(dbl).to receive(:foo).and_return(1,2,3)

    expect(dbl.foo).to eq(1)
    expect(dbl.foo).to eq(2)
    expect(dbl.foo).to eq(3)
    expect(dbl.foo).to eq(3)
    expect(dbl.foo).to eq(3)
  end
end
