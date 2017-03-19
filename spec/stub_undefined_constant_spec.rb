describe 'stubbing Foo' do
  it 'can stub undefined constant FOO' do
    stub_const("FOO", 5)
    expect(FOO).to eq(5)
  end

  it 'undefines the constant when the example completes' do
    expect { FOO }.to raise_error(NameError)
  end
end

module MyGem
  class SomeClass; end
end

module MyGem
  describe SomeClass do
    it 'can stub an arbitrarily deep constant that is undefined' do
      expect(defined?(SomeClass::A)).to be_falsey
      stub_const("MyGem::SomeClass::A::B::C", 3)
      expect(SomeClass::A::B::C).to eq(3)
      expect(SomeClass::A).to be_a(Module)
    end

    it 'undefines the intermediary constants that were dynamically created' do
      expect(defined?(SomeClass)).to be_truthy
      expect(defined?(SomeClass::A)).to be_falsey
    end
  end
end
