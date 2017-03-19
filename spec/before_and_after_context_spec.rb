describe '0: before and after callbacks' do
  p "1st: #{self}"
  before(:context) do
    puts '1: outer before context'
  end

  example '2: in outer group' do
  p "2nd: #{self}"
    p self
  end

  after(:context) do
    puts '7: outer after context'
  end

  describe '3: nested group' do
      p "3rd: #{self}"
    before(:context) do
      puts '4: inner before context'
    end

    example '5: in nested group' do
      p "4th: #{self}"
    end

    after(:context) do
      puts '6: inner after context'
    end
  end
end

describe 'something' do
  describe 'anything' do
    it 'anything else' do
      p "5th: #{self}"
    end
  end
end

context 'really' do
  before(:context) do
    p "6th: #{self}"
  end

  it 'really??' do
    p "6th: #{self}"
  end
end

describe 'before and after callbacks' do
  before(:context) do
    @outer_state = 'set in outer before context'
  end

  example 'in outer group' do
    expect(@outer_state).to eq('set in outer before context')
  end

  describe 'nested group' do
    before(:context) do
      @inner_state = 'set in inner before context'
    end

    example 'in nested group' do
      expect(@outer_state).to eq('set in outer before context')
      expect(@inner_state).to eq('set in inner before context')
    end

    after(:context) do
      expect(@inner_state).to eq('set in inner before context')
    end
  end

  after(:context) do
    expect(@outer_state).to eq('set in outer before context')
  end
end

# describe 'error in before(:example)' do
#   before(:example) do
#     raise 'this error'
#   end
# 
#   it 'is reported as failure' do
#   end
# end
