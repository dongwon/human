require 'rspec/expectations'

class Thing
  def widgets
    @widgets ||= []
  end
end

describe Thing do
  before(:context) do
    @thing = Thing.new
  end

  describe 'initialized in before(:context)' do
    it 'has 0 widgets' do
      expect(@thing.widgets.count).to eq(0)
    end

    it 'can accept new widgets' do
      @thing.widgets << Object.new
      p @thing.widgets.count
    end

    it 'shares state across examples' do
      expect(@thing.widgets.count).to eq(1)
    end
  end
end

# it all fails
# describe 'an error in before(:context)' do
#   before(:context) do
#     raise "opps"
#   end
# 
#   it 'fails this example' do
#   end
# 
#   it 'fails this example, too' do
#   end
# 
#   after(:context) do
#     puts 'after context ran'
#   end
# 
#   describe 'nested group' do
#     it 'fails this third example' do
#     end
# 
#     it 'fails this fourth example' do
#     end
# 
#     describe 'yet another level deep' do
#       it 'fails this last example' do
#       end
#     end
#   end
# end

describe 'something' do
  before :context do
    @value = 123
  end

  describe 'nested' do
    it 'accesses state set in before(:context)' do
      expect(@value).to eq(123)
    end

    describe 'netsted more deeply' do
      it 'accesses state set in before(:context)' do
        expect(@value).to eq(123)
      end
    end
  end

  describe 'nested in parallel' do
    it 'accesses state set in before(:context)' do
      expect(@value).to eq(123)
    end
  end
end
