FOOO = 7

describe 'hiding FOOO' do
  it 'can hide FOOO' do
    hide_const("FOOO")
    expect { FOOO }.to raise_error(NameError)
  end

  it 'restores the hidden constant when the example completes' do
    expect(FOOO).to eq(7)
  end
end

module MyGem
  class SomeClass
    FOO = 7
  end
end

module MyGem
  describe SomeClass do
    it 'hides the nested constant when it is fully qualified' do
      hide_const("MyGem::SomeClass::FOO")
      expect { SomeClass::FOO }.to raise_error(NameError)
    end

    it 'restores the hidden constant when the example completes' do
      expect(MyGem::SomeClass::FOO).to eq(7)
    end
  end
end

describe 'hiding UNDEFINED_CONSTANT' do
  it 'has no effect' do
    hide_const("UNDEFINED_CONSTANT")
    expect { UNDEFINED_CONSTANT }.to raise_error(NameError)
  end

  it 'is still undefined after the example completes' do
    expect { UNDEFINED_CONSTANT }.to raise_error(NameError)
  end
end
