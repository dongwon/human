describe 'specifying a return value using a block' do
  it 'returns the blocks return value' do
    dbl = double
    allow(dbl).to receive(:foo) { 14 }
    expect(dbl.foo).to eq(14)
  end
end

# describe 'verifying arguments using a blocks' do
#   it 'fails when the arguments do not meet the expectations set in the block' do
#     dbl = double
# 
#     allow(dbl).to receive(:foo) do |arg|
#       expect(arg).to eq("bar")
#     end
# 
#     dbl.foo(nil)
#   end
# end

describe 'performing a calculation using a block' do
  it 'returns the blocks return value' do
    loan = double("Loan", :amount => 100)

    allow(loan).to receive(:required_payment_for_rate) do |rate|
      loan.amount * rate
    end

    expect(loan.required_payment_for_rate(0.05)).to eq(5)
    expect(loan.required_payment_for_rate(0.1)).to eq(10)
  end
end

describe 'when the caller passes a block' do
  it 'can be yielded to from your implementation block' do
    dbl = double
    allow(dbl).to receive(:foo) { |&block| block.call(14) }
    expect { |probe| dbl.foo(&probe) }.to yield_with_args(14)
  end
end

class Calculator
  def self.add(x, y)
    x + y
  end
end

describe 'when using a block implementation on a partial double' do
  it 'supports delegating to the original implementation' do
    original_add = Calculator.method(:add)

    allow(Calculator).to receive(:add) do |x, y|
      original_add.call(x, y) * 2
    end

    expect(Calculator.add(2, 5)).to eq(14)
  end
end

describe 'an http api client' do
  it 'can simulate transient network failures' do
    client = double("MyHTTPClient")

    call_count = 0
    allow(client).to receive(:fetch_data) do
      call_count += 1
      p call_count
      call_count.odd? ? raise("timeout") : { :count => call_count }
      # call_count.odd? ? raise("timeout") : { :count => 15 }
    end

    expect { client.fetch_data }.to raise_error("timeout")
    expect(client.fetch_data).to eq(:count => 2)
    expect { client.fetch_data }.to raise_error("timeout")
    expect(client.fetch_data).to eq(:count => 4)
  end
end
