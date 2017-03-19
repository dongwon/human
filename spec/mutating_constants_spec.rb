module MyGem
  class SomeClass; end
end

module MyGem
  describe 'something' do
    let(:fake_class) { Class.new }

    it 'accidentally stubs the wrong constant' do
      # this is stubs ::SomeClass (in the top-level namespace),
      # not MyGem::SomeClass like you probably mean.
      stub_const("SomeClass", fake_class)
      p fake_class
    end

    it 'stubs the right constant' do
      stub_const("MyGem::SomeClass", fake_class)
      p fake_class
    end
  end
end

class CardDeck
  SUITS = [:Spades, :Diamonds, :Clubs, :Hearts]
  NUM_CARDS = 52
end

describe 'anything' do
  let (:fake_class) { Class.new }

  it 'without transfer' do
    stub_const("CardDeck", fake_class)
    CardDeck
    #CardDeck::SUITS
    #CardDeck::NUM_CARDS
  end

  it 'with transfer true' do
    stub_const("CardDeck", fake_class, :transfer_nested_constants => true)
    CardDeck::SUITS
    CardDeck::NUM_CARDS
  end

  it 'with transfer for a const' do
    stub_const("CardDeck", fake_class, :transfer_nested_constants => [:SUITS])
    CardDeck::SUITS
    #CardDeck::NUM_CARDS
  end
end
