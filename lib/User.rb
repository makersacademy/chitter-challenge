require 'pg'

class User
  attr_reader :id, :username, :name, :email, :password

    def initialize(id:, username:, name:, email:, password:)
      @id = id
      @username = email
      @name = name
      @email = email
      @password = password
    end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM all_users;')
    result.map {|user| p user['username']}
  end

  def self.create(username:, name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO all_users (username, name, email, password) VALUES('#{username}', '#{name}', '#{email}', '#{password}');")
  end
end
