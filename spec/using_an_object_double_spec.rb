class User
  def save; sleep 3; end
end

def save_user(user)
  "saved!" if user.save
end

#p User.new.save

describe '#save_user' do
  it 'renders message on success' do
    user = object_double(User.new, :save => true)
    p user.save
    expect(save_user(user)).to eq("saved!")
  end
end

#############################################################

require 'logger'

module MyApp
  LOGGER = Logger.new("/tmp/myapp")
end

class Email
  def self.send_to(recipient)
    MyApp::LOGGER.info("Sent to #{recipient}")
    # other emailing logic
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
