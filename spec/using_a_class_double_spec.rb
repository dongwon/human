require 'spec_helper'

describe User, '#suspend!' do
  it 'notifies the console' do
    notifier = class_double("ConsoleNotifier").
      as_stubbed_const(:transfer_nested_constants => true)

    expect(notifier).to receive(:notify).with("suspended as")
    expect(ConsoleNotifier::MAX_WIDTH).to eq(80)

    user = User.new
    user.suspend!
  end
end
