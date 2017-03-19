require 'spec_helper'
require 'using_an_object_double'

describe '#save_user' do
  it 'renders message on success' do
    user = object_double(User.new, :save => true)
    expect(save_user(user)).to eq("saved!")
  end
end

describe Email do
  it 'logs a message when sending' do
    logger = object_double("MyApp::LOGGER", :info => nil).
      as_stubbed_const
    Email.send_to('hello@foo.com')
    expect(logger).to have_received(:info).with("Sent to hello@foo.com")
  end
end
