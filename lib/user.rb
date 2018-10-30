class User

  def set_email(email)
    @email = email
    'email set'
  end

  def set_password(password)
    @password = password
    'password set'
  end

  def set_name(name)
    @name = name
    'name set'
  end

  def set_username(username)
    @username = username
    'username set'
  end

  def get_email
    @email
  end

  def get_password
    @password
  end

  def get_name
    @name
  end

  def get_username
    @username
  end
end
