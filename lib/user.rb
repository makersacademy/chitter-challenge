require 'pg'
class User

  attr_accessor :name, :username

  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

def self.create(name:, username:, email:, password:)
  if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("INSERT INTO chitter_user(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password")
  end
end
