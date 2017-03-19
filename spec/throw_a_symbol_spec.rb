describe 'Making it throw a symbol' do
  it 'throws the provided symbol' do
    dbl = double
    allow(dbl).to receive(:foo).and_throw(:hello)

    catch :hello do
      dbl.foo
      fail "should not get here"
    end
  end

  it 'includes the provided argument when throwing' do
    dbl = double
    allow(dbl).to receive(:foo).and_throw(:hello, "world")

    arg = catch :hello do
      dbl.foo
      fail "should not get here"
    end

    expect(arg).to eq("world")
  end
end
