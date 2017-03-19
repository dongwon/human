class User
  def save; sleep 3; end
end

def save_user(user)
  "saved!" if user.save
end

require 'logger'

module MyApp
  LOGGER = Logger.new("/tmp/myapp")
end

class Email
  def self.send_to(recipient)
    MyApp::LOGGER.info("Sent to #{recipient}")
  end
end

