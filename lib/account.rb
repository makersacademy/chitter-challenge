require 'pg'

class Account

  attr_reader :username

  def initialize(username:, email:, password:)
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO accounts (username, email, password) VALUES($1, $2, $3) RETURNING id, username, email, password;", [username, email, password])
    Account.new(username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

end
