require 'pg'
require_relative 'user'

class Session

attr_reader :handle, :password

  def initialize(handle:, password:)
    @handle = handle
    @password = password
  end

  def self.find_user(handle:, password:)
    connection = pg_connection
    user = connection.exec_params("SELECT * FROM chitter_users WHERE handle = $1 AND password = $2", [handle, password])
    User.new(full_name: user[0]['chitterer'], username: user[0]['username'], handle: user[0]['handle'], email: user[0]['email'], password: user[0]['password'])
  end
 

  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect("postgres://tjcpisthcdezaj:e8888f176d8c4a9279a0c01b0ab685b3c51d82a97c406f0778ac35dccb85bfb1@ec2-3-213-228-206.compute-1.amazonaws.com:5432/db76t2s6m0vebl")
    end
  end
end
