require 'pg'

class User 
  attr_reader :email, :id

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    connect = PG.connect(dbname: 'chitter_test')
    result = connect.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id)
    connect = PG.connect(dbname: 'chitter_test')
    result = connect.exec("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
  end