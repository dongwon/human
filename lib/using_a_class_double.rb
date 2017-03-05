class User
  def suspend!
    ConsoleNotifier.notify("suspended as")
  end
end

class ConsoleNotifier
  MAX_WIDTH = 80

  def self.notify(message)
    puts message
  end
end
