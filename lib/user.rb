require 'pg'

class User
  attr_reader :name, :password, :email

  def initialize(name:, password:, email:)
    @name = name
    @password = password
    @email = email
  end

  def self.add(name:, password:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (name, password, email) VALUES ('#{name}', '#{password}', '#{email}') RETURNING name, password, email")
    User.new(name: result[0]['name'], password: result[0]['password'], email: result[0]['email'])
  end

end
