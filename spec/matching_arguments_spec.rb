describe 'constraining a message expectation using with' do
  let(:dbl) { double }
  before { expect(dbl).to receive(:foo).with(1, anything, /bar/) }

  it 'passes when the args match' do
    dbl.foo(1, nil, "barn")
  end

  it 'fails when the args do not match' do
    dbl.foo(1, nil, "other bar")
  end
end

describe 'using a rspec matcher' do
  let(:dbl) { double }
  before { expect(dbl).to receive(:foo).with(a_collection_containing_exactly(1,2)) }

  it 'passes when the args match' do
    dbl.foo([2,1])
  end

  it 'fails when the args do not match' do
    # dbl.foo([1,3])
    dbl.foo([1,2])
  end
end

RSpec::Matchers.define :a_multiple_of do |x|
  match { |actual| (actual % x).zero? }
end

describe 'using a custom matcher' do
  let(:dbl) { double }
  before { expect(dbl).to receive(:foo).with(a_multiple_of(3)) }

  it 'passes when the args match' do
    dbl.foo(12)
  end

  it 'fails when the args do not match' do
    dbl.foo(15)
    # dbl.foo(13)
  end
end

describe 'using #with to constrain responses' do
  specify "its response depends on the arguments" do
    dbl = double

    # set a default for any unmatched args
    allow(dbl).to receive(:foo).and_return(:default)

    allow(dbl).to receive(:foo).with(1).and_return(1)
    allow(dbl).to receive(:foo).with(2).and_return(2)

    expect(dbl.foo(0)).to eq(:default)
    expect(dbl.foo(1)).to eq(1)
    expect(dbl.foo(2)).to eq(2)
  end
end
