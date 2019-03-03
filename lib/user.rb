require 'pg'
require './lib/db_connection'
require './db_connection_setup'

class User

  attr_reader :id, :email

  def initialze(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    result = DbConnection.query("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

end
