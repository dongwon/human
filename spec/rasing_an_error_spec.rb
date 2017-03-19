describe 'Making it raise an error' do
  it 'raises the provided exception' do
    dbl = double
    allow(dbl).to receive(:foo).and_raise("boom")
#    dbl.foo
  end
end
