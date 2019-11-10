class User
  attr_reader :first, :last, :email, :id, :handle

  def initialize(first, last, email, password, id, handle)
    @first = first
    @last = last
    @email = email
    @password = password
    @id = id
    @handle = handle
  end

  def self.create(first, last, email, password, bitter_handle)
    query = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, email, password, bitter_handle) 
      VALUES ('#{first}', '#{last}', '#{email}', '#{password}', '#{bitter_handle}')
      RETURNING id;"
    )
    id = query.values[0][0].to_i
    user = User.new(first, last, email, password, id, bitter_handle)
  end

  def self.find(email)
    user = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return nil if !user.values[0]
    return user.values[0]
  end

  def self.authenticate(email, password)
    user = User.find(email)
    if user && password == user[2] && email == user[1]
      return user
    elsif user && password != user[2] && email == user[1]
      return false
    else
      return nil
    end
  end
end