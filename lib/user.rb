require_relative 'db_connect'

class User
  attr_reader :id, :handle, :email, :password

  def initialize(id:, handle:, email:, password:)
    @id = :id
    @handle = handle
    @email = email
    @password = password
    @logged_in = false
  end

  def self.create(handle:, password:, email:)
    connection = DBConnect.check_environment
    result = connection.exec_params('INSERT INTO users (handle, password, email) VALUES ($1, $2, $3) RETURNING id, handle, email, password;', [handle, password, email,])
    User.create_new_instance(result)
  end

  def self.login(email:, password:)
    connection = DBConnect.check_environment
    result = connection.exec_params('SELECT id, handle, password, email FROM users WHERE email = $1 AND password = $2;',[email, password])
    connection.exec_params('UPDATE users SET logged_in = true WHERE email = $1 AND password = $2;', [email, password])
    result.map { |user| { handle: user['handle'], email: user['email'], password: user['password'], logged_in: user['logged_in'] = true } }.pop
  end

  private

  def self.create_new_instance(result)
    User.new(id: result[0]['id'], handle: result[0]['handle'], email: result[0]['email'], password: result[0]['password'])
  end

end