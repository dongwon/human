# This can be useful when you want 
# to utilise an external object but mutate it's response.

class API
  def self.solve_for(x)
    p (1..x).to_a
  end
end

describe 'and_wrap_original' do
  it 'responds as it normally would, modified by the block' do
    expect(API).to receive(:solve_for).and_wrap_original do |m, *args|
      m.call(*args).first(5)
    end
    expect(API.solve_for(100)).to eq [1,2,3,4,5]
  end
end

describe 'and_wrap_original' do
  it 'can be overriden for specific arguments using #with' do
    allow(API).to receive(:solve_for).and_wrap_original do |m, *args|
      m.call(*args).first(5)
    end
    allow(API).to receive(:solve_for).with(2).and_return([3])

    expect(API.solve_for(20)).to eq [1,2,3,4,5]
    expect(API.solve_for(2)).to eq [3]
  end
end
