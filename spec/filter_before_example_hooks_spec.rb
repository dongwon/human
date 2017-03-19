RSpec.configure do |config|
  config.before(:example, :foo => :bar) do
    invoked_hooks << :before_example_foo_bar
    p "I am before!"
  end
end

describe 'a filtered before :example hook' do
  let(:invoked_hooks) { [] }

  describe 'group without matching metadata' do
    it 'does not run the hook' do
      expect(invoked_hooks).to be_empty
      p invoked_hooks
    end

    it 'runs the hook for an example with matching metadata', :foo => :bar do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
      p invoked_hooks
    end
  end

  describe 'group with matching metadata', :foo => :bar do
    it 'runs the hook' do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
      p invoked_hooks
    end
  end
end
