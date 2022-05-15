require 'pg'

class User

  attr_reader :full_name, :username, :email, :handle, :password

  def initialize(full_name:, username:, email:, handle:, password:)
    @username = username
    @email = email
    @handle = handle
    @password = password
    @full_name = full_name
  end

  def self.sign_up(full_name:, username:, handle:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO chitter_users (chitterer, username, handle, email, password) VALUES ('#{full_name}', '#{username}', '#{handle}', '#{email}', '#{password}') RETURNING chitterer, username, handle, email, password;")
    User.new(full_name: result[0]['chitterer'], username: result[0]['username'], handle: result[0]['handle'], email: result[0]['email'], password: result[0]['password'])
  end
end
