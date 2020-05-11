require 'pg'

class User
  attr_reader :id, :email, :password

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}')
     RETURNING id, email, password;")
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    return nil unless id

    result = connection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(
        id: result[0]['id'],
        email: result[0]['email'],
      )
  end
end
