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
    result = connection.exec_params("INSERT INTO chitter_users (chitterer, username, handle, email, password) VALUES ($1, $2, $3, $4, $5) RETURNING chitterer, username, handle, email, password;", [full_name, username, handle, email, password])
    User.new(full_name: result[0]['chitterer'], username: result[0]['username'], handle: result[0]['handle'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect("postgres://tjcpisthcdezaj:e8888f176d8c4a9279a0c01b0ab685b3c51d82a97c406f0778ac35dccb85bfb1@ec2-3-213-228-206.compute-1.amazonaws.com:5432/db76t2s6m0vebl")
    end
  end
end
