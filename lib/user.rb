require 'pg'

class User

attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def self.create(email, password)

    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}');")
     User.new(result[0]['id'], result[0]['email'])
  end

  def self.find(id)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM users WHERE id = '#{id}';")
    User.new( result[0]['id'], result[0]['email'])
  end
end
