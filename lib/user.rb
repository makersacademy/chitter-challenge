require_relative 'db_connect'

class User
  attr_reader :id, :handle, :email, :password

  def initialize(id:, handle:, email:, password:)
    @id = :id
    @handle = handle
    @email = email
    @password = password
  end

  def self.handle(handle:)
    connection = DBConnect.check_environment
    result = connection.exec_params('SELECT id, handle, password, email FROM users WHERE handle = $1;', [handle])
    result.select { |user| user['handle'] == user['$1'] }
    User.create_new_instance(result)
  end

  def self.create(handle:, password:, email:)
    connection = DBConnect.check_environment
    result = connection.exec_params('INSERT INTO users (handle, password, email) VALUES ($1, $2, $3) RETURNING id, handle, email, password;', [handle, password, email,])
    User.create_new_instance(result)
  end

  private

  def self.create_new_instance(result)
    User.new(id: result[0]['id'], handle: result[0]['handle'], email: result[0]['email'], password: result[0]['password'])
  end

end