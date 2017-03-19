# https://coderwall.com/p/rgdhmq/inheriting-from-struct
class Customer < Struct.new(:notifier)
  def suspend!
    notifier.notify("suspended as")
  end
end

class ConsoleNotifier
  def notify(message)
    puts message
  end
end
