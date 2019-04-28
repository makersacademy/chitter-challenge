require 'pg'

class User
  def self.create(
    first_name:,last_name:,
    email:, password:, user_name:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec(
      "INSERT INTO users (first_name, last_name, email, password, user_name)
      VALUES ('#{first_name}', '#{last_name}', '#{email}', '#{password}', '#{user_name}')
      RETURNING id, first_name, last_name, email, user_name"
    )

    User.new(
      id: result[0]['id'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
    user_name: result[0]['user_name'])
  end

  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    return nil unless id

    result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")

   User.new(
      id: result[0]['id'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
      user_name: result[0]['user_name'])
  end

  attr_reader :id, :first_name, :last_name, :email, :user_name

  def initialize(id:, first_name:, last_name:, email:, user_name:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @user_name = user_name
  end

end
