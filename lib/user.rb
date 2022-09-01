require 'pg'

class User

  attr_reader :name, :email, :password

  def initialize(name:, email:, password:)
    @name = name
    @email = email
    @password = password
  end

  def self.sign_up(name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'users_test')
    else
      connection = PG.connect(dbname: 'users')
    end
    result = connection.exec_params("INSERT INTO customer (name, email, password) VALUES($1,$2,$3) RETURNING id, name, email, password;",[name, email, password])
    User.new(name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end
end