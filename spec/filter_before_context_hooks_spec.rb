RSpec.configure do |config|
  config.before(:context, :foo => :bar) { @hook = :before_context_foo_bar }
end

describe 'a filtered before(:context) hook' do
  describe 'a group without matching metadata' do
    it 'does not run the hook' do
      expect(@hook).to be_nil
    end

    it 'runs the hook for a single example with matching metadata', :foo => :bar do
      expect(@hook).to eq(:before_context_foo_bar)
    end

    describe 'a nested subgroup with matching metadata', :foo => :bar do
      it 'runs the hook' do
        expect(@hook).to eq(:before_context_foo_bar)
      end
    end
  end

  describe 'a group with matching', :foo => :bar do
    it 'runs the hook' do
      expect(@hook).to eq(:before_context_foo_bar)
    end

    describe 'a nested subgroup' do
      it 'runs the hook' do
        expect(@hook).to eq(:before_context_foo_bar)
      end
    end
  end
end
