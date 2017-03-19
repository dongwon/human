FOOO = 7

describe 'stubbing FOOO' do
  it 'can stub FOOO with a different value' do
    stub_const("FOOO", 5)
    expect(FOOO).to eq(5)
  end

  it 'restores the stubbed constant when the example completes' do
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
    it 'stubs the nested constant when it is fully qualified' do
      stub_const("MyGem::SomeClass::FOO", 5)
      expect(SomeClass::FOO).to eq(5)
      expect(MyGem::SomeClass::FOO).to eq(5)
    end

    let(:fake_class) { Class.new }

    it 'does not transfer nested constants by default' do
      stub_const("MyGem::SomeClass", fake_class)
      # it doesn't raise anyting at all???
      expect { SomeClass::FOO }.to raise_error(NameError)
    end

    it 'transfers nested constants when using :transfer_nested_constants => true' do
      stub_const("MyGem::SomeClass", fake_class, :transfer_nested_constants => true)
      expect(SomeClass::FOO).to eq(7)
    end

    it 'can specify a list of nested constants to transfer' do
      stub_const("MyGem::SomeClass", fake_class, :transfer_nested_constants => [:FOO])
      expect(SomeClass::FOO).to eq(7)
    end
  end
end
