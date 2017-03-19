RSpec.configure do |config|
  config.after(:example, :foo => :bar) do
    raise "boom!"
  end
end

describe 'a filtered after :example hook' do
  describe 'group without matching metadata' do
    it 'does not run the hook' do
      # should pass
    end

#    it 'runs the hook for an example with matching metadata', :foo => :bar do
#      # should fail
#    end
  end
#
#  describe 'group with matching metadata', :foo => :bar do
#    it 'runs the hook' do
#      #should fail
#    end
#  end
end
