require 'pg'

class User
  attr_reader :id, :email, :name, :username
  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email:, name:, username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: "chitter_test")
    else
      con = PG.connect(dbname: "chitter")
    end

    con.exec("INSERT INTO users (email, name, username, password) VALUES('#{email}', '#{name}', '#{username}', '#{password}') RETURNING id, email, name, username, password;")
  end

  def self.find(id:)
    return nil unless id

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: "chitter_test")
    else
      con = PG.connect(dbname: "chitter")
    end
    p id
    result = con.exec("SELECT * FROM users WHERE id = '#{id}'")
    
    User.new(id: result.first['id'], email: result.first['email'], name: result.first['name'], username: result.first['username'])
  end
end
