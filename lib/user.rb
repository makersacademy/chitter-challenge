require 'pg'

class User
  attr_reader :email, :username, :password, :name

  def initialize(email:, username:, password:, name:)
    @email = email
    @username = username
    @password = password
    @name = name
  end

  def self.create(email:, username:, password:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    rs = con.exec_params("INSERT INTO users (email, username, password, name) VALUES ($1, $2, $3, $4) RETURNING email, username, password, name", [email, username, password, name])
  end
end