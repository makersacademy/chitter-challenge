class User

  @@users = []

  def self.all
    @@users
  end

  def self.create(username, email)
    @@users << {username: username, email: email}
  end

end