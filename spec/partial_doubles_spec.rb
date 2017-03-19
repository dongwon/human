require 'spec_helper'
require 'partial_doubles'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

RSpec.describe '#save_user' do
  it 'renders message on success' do
  user = User.new
  expect(user).to receive(:save).and_return(true) #Type in name
  expect(save_user(user)).to eq("saved!")
  end
end
