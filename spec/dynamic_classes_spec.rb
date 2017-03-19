require 'spec_helper'
require 'dynamic_classes'

# If you comment out belows, other specs might fails.
# RSpec.configuration.mock_with(:rspec) do |config|
#   config.before_verifying_doubles do |reference|
#     reference.target.define_attribute_methods
#   end
# end

describe User do
  it 'can be doubled' do
    instance_double("User", :name => "Don")
    instance_double("User", :name => "Don", :email => "don@example.com")
  end
end
