require 'set'

shared_examples 'a collection object' do
  describe '<<' do
    it 'adds objects to the end of the collection' do
      collection << 1
      collection << 2
      expect(collection.to_a).to match_array([1,2])
    end
  end
end

describe Array do
  it_behaves_like 'a collection object' do
    let(:collection) { Array.new }
  end
end

describe Set do
  it_behaves_like 'a collection object' do
    let(:collection) { Set.new }
  end
end

RSpec.configure do |c|
  c.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end

shared_examples 'sortability' do
  it 'responds to <=>' do
    expect(sortable).to respond_to(:<=>)
  end
end

describe String do
  it_has_behavior 'sortability' do
    let(:sortable) { 'sample string' }
  end
end
