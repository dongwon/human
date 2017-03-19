require 'playground'

describe Playground do
  context 'when there are no children' do
    let(:playground) { Playground.new(0) }

    it 'is quite boring place' do
      expect(playground.mood).to eq('boring')
    end

    it 'is empty' do
      expect(playground).to be_empty
    end

    it 'is good' do
      expect(playground).to be_good
    end
  end
end
