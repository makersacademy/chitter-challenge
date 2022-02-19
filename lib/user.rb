require 'pg'

class User

  attr_reader :first_name, :last_name, :email, :user_password, :id

  def initialize(first_name:, last_name:, email:, user_password:, id:)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @user_password = user_password
    @id = id
  end

  def self.create(id:, first_name:, last_name:, email:, user_password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec(
      "INSERT INTO users (first_name, last_name, email, user_password) 
      VALUES('#{first_name}', '#{last_name}', '#{email}', '#{user_password}') 
      RETURNING id, first_name, last_name, email, user_password;").first
    User.new(id: result['id'], first_name: result['first_name'], last_name: result['last_name'], 
  email: result['email'], user_password: result['user_password'])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec_params(
      "SELECT * FROM users WHERE id = $1", [id]).first
    if result.nil?
      nil
    else
      User.new(id: result['id'], first_name: result['first_name'], last_name: result['last_name'], 
  email: result['email'], user_password: result['user_password'])
    end
  end

  def self.find_by(email:, user_password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec_params(
      "SELECT * FROM users WHERE email = $1 AND user_password = $2",
      [email, user_password]).first
    if result
      User.new(id: result['id'], first_name: result['first_name'], last_name: result['last_name'], 
  email: result['email'], user_password: result['user_password'])
    else nil
    end
  end
end
