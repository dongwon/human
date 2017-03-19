example_msgs = []

RSpec.configure do |config|
  config.after(:context, :foo => :bar) do
    puts 'after :context'
  end
end

describe 'a filtered after(:context) hook' do
  describe 'a group without matching metadata' do
    it 'does not run the hook' do
      puts 'unfiltered'
    end

    it 'runs the hook for a single example with matching metadata', :foo => :bar do
      puts 'filtered 1'
    end
  end

  describe 'a group with matching metadata', :foo => :bar do
    it 'runs the hook' do
      puts 'filtered 2'
    end
  end

  describe 'another group without matching metadata' do
    describe 'a nested subgroup with matching metadata', :foo => :bar do
      it 'runs the hook' do
        puts 'filtered 3'
      end
    end
  end
end
