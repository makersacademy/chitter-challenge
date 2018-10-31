class User

  def change_email(email)
    @email = email
    'email set'
  end

  def change_password(password)
    @password = password
    'password set'
  end

  def change_name(name)
    @name = name
    'name set'
  end

  def change_username(username)
    @username = username
    'username set'
  end

  def view_email
    @email
  end

  def view_password
    @password
  end

  def view_name
    @name
  end

  def view_username
    @username
  end
end
