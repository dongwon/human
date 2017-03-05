require 'bundler/setup'

#require 'human'

# to verify instance methods
#require 'using_an_instance_double'

# to verify methods of class and module
#require 'using_a_class_double'

# to create a double from an existing "template" object, from
# which it verifies that any stubbed methods on the double also exist on the template. This is
# useful for objects that are readily constructable, but may have far-reaching side-effects
# such as talking to a database or external API.
#require 'using_an_object_double'

require 'dynamic_classes'


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
end
