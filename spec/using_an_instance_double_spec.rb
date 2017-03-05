require 'spec_helper'

RSpec.describe User, '#suspend!' do
  it 'notifies the console' do
    notifier = instance_double("ConsoleNotifier")

    expect(notifier).to receive(:notify).with("suspended as")

    user = User.new(notifier)
    user.suspend!
  end
end
