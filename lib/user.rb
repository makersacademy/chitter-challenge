require 'bcrypt'

class User
  attr_reader :id, :first_name, :last_name, :email, :handle

  def initialize(id, first_name, last_name, email, handle)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @handle = handle
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user| 
      User.new(
        user['id'],
        user['first_name'], 
        user['last_name'],
        user['email'],
        user['handle']
      )
    end
  end

  def self.create(first_name:, last_name:, email:, handle:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, email, handle, password) VALUES($1, $2, $3, $4, $5) RETURNING id, first_name, last_name, email, handle, password", 
      [first_name, last_name, email, handle, encrypted_password]
    )
    User.new(result[0]['id'],
            result[0]['first_name'], 
            result[0]['last_name'], 
            result[0]['email'], 
            result[0]['handle']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(result[0]['id'],
      result[0]['first_name'], 
      result[0]['last_name'], 
      result[0]['email'], 
      result[0]['handle']
    )  
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1", [email])
    return nil unless result.any?
    User.new(result[0]['id'],
            result[0]['first_name'], 
            result[0]['last_name'], 
            result[0]['email'], 
            result[0]['handle']
    )
  end
end