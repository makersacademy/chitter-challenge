require 'pg'

class User

  attr_reader :id, :email, :password

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM users;")
    result.map { |user|
      User.new(id: user['id'], email: user['email'], password: user['password'])
    }
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email, password;")
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id:)
    return nil unless id
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    p "User.rb id received is =>"
    p id
    result = connection.exec("SELECT * FROM users WHERE id = #{id}")
    # result = DatabaseConnect("SELECT * FROM bookmarks WHERE id = #{id};")

    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
  end
end