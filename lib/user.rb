class User

  @@current_user = "admin"

  def self.current
    @@current_user
  end

  def self.change(name)
    @@current_user = name
  end

end
