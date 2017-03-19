require 'rspec/expectations'

class Thing
  def widgets
    @widgets ||= []
  end
end

describe Thing do
  before(:example) do
    @thing = Thing.new
  end

  describe 'initialized in before(:example)' do
    it 'has 0 widgets' do
      expect(@thing.widgets.count).to eq(0)
    end

    it 'can accept new widgets' do
      @thing.widgets << Object.new
      p @thing.widgets.count
    end

    it 'does not share state across examples' do
      expect(@thing.widgets.count).to eq(0)
    end
  end
end
