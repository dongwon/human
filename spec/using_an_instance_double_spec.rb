require 'spec_helper'
require 'using_an_instance_double'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|

    # This option should be set when all dependencies are being loaded
    # before a spec run, as is the case in a typical spec helper. It will
    # cause any verifying double instantiation for a class that does not
    # exist to raise, protecting against incorrectly spelt names.
    mocks.verify_doubled_constant_names = true
  end
end

RSpec.describe Customer, '#suspend!' do
  it 'notifies the console' do
    notifier = instance_double("ConsoleNotifier")

    expect(notifier).to receive(:notify).with("suspended as")

    user = Customer.new(notifier)
    user.suspend!
  end
end
