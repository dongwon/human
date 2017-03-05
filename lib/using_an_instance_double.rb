class User < Struct.new(:notifier)
  # https://coderwall.com/p/rgdhmq/inheriting-from-struct
  def suspend!
    notifier.notify("suspended as")
  end
end

class ConsoleNotifier
  def notify(message)
    puts message
  end
end
