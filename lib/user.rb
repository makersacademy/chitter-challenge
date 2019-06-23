require 'pg'

class User

  attr_reader :id, :first_name, :last_name, :username, :email, :name

  def initialize(id:, first_name:, last_name:, username:, email:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @name = "#{first_name} #{last_name}"
    @username = username
    @email = email
  end

  def self.create(first_name:, last_name:, username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, username, email, password)
        VALUES('#{first_name}', '#{last_name}', '#{username}',
          '#{email}', '#{password}')
          RETURNING id, first_name, last_name, username, email;"
    )
    return_new_user(result)
  end

  def self.return_new_user(result)
    User.new(
      id: result[0]['id'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end
end
