RSpec.configure do |c|
  c.alias_example_group_to :detail, :detailed => true
end

RSpec.detail "a detail" do
  it 'can do some less important stuff' do
  end
end

describe 'a thing' do
  describe 'in broad strokes' do
    it 'can do things' do
    end
  end

  detail 'something less important' do
    it 'can do an unimportant thing' do
    end
  end
end
