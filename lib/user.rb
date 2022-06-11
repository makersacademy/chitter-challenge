class User
  def self.create(name, email, username, password)
    @username = username
  end

  def self.username
    @username
  end
end
