describe 'Making it yield arguments' do
  it 'yields the provided args' do
    dbl = double
    allow(dbl).to receive(:foo).and_yield(2,3)

    x = y = nil
    assigner = Proc.new do |a, b|
      x, y = a, b
      p x, y
    end

    dbl.foo(x, y, &assigner)
    # dbl.foo { |a, b| x, y = a, b }
    expect(x).to eq(2)
    expect(y).to eq(3)
  end
end

describe 'Making it yield' do
  it 'fails when the caller does not provide a block' do
    dbl = double
    allow(dbl).to receive(:foo).and_yield(2,3)
    # dbl.foo
    # So, you should provide a block
    dbl.foo { |a, b| x, y = a, b}
  end
end

describe 'Making it yield' do
  it 'fails when the callers block does not accept the provided arguments' do
    dbl = double
    allow(dbl).to receive(:foo).and_yield(2,3)
    # dbl.foo { |x| }
    # So, accept arguments
    dbl.foo { |a, b| x, y = a, b}
  end
end

describe 'Making it yield multiple times' do
  it 'yields the specified args in succession' do
    yielded = []

    dbl = double
    allow(dbl).to receive(:foo).and_yield(1).and_yield(2).and_yield(3)

    assigner = Proc.new do |x|
      yielded << x
    end
    dbl.foo(yielded, &assigner)

    # Same as below
    # dbl.foo { |x| yielded << x }

    expect(yielded).to eq([1,2,3])
  end
end
