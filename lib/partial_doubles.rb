class User
  def save
    false
  end
end

def save_user(user)
  "saved!" if user.save
end
