require 'pg'

class ChitterAccount
  attr_reader :name, :username, :email

  def initialize (name:, username:, email:)
    @name = name
    @username = username
    @email = email
  end
    
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_accounts_test')
    else
      connection = PG.connect(dbname: 'chitter_accounts')
    end
    rs = connection.exec("SELECT username, name, email FROM accounts;")
    rs.map do |account|
      ChitterAccount.new(name: account['name'], username: account['username'], email: account['email'])
    end
  end

  def self.create(username:, name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_accounts_test')
    else
      connection = PG.connect(dbname: 'chitter_accounts')
    end    
    result = connection.exec("INSERT INTO accounts (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{password}') RETURNING username, name, email;")
    ChitterAccount.new(username: result[0]['username'], name: result[0]['name'], email: result[0]['email'])
  end
end

# set up database helper truncating the accounts table each go 