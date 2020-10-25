require 'pg'

class ChitterAccount

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_accounts_test')
    else
      connection = PG.connect(dbname: 'chitter_accounts')
    end
    rs = connection.exec(SELECT username FROM accounts)
    rs.map do |account|
      account['username']
    end
  end

  def self.create(username:, name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_accounts_test')
    else
      connection = PG.connect(dbname: 'chitter_accounts')
    end    
    connection.exec("INSERT INTO accounts (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{password}') RETURNING username;")
  end
end

# create test database, set up database helper truncating the accounts table each go 