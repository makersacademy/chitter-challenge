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

  def self.current_usernames
    usernames = []
    ChitterAccount.all.each do |account|
      usernames << account.username
    end
    usernames
  end

  def self.create(username:, name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_accounts_test')
    else
      connection = PG.connect(dbname: 'chitter_accounts')
    end    

    raise 'username already in use' if current_usernames.include?(username)

    result = connection.exec("INSERT INTO accounts (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{password}') RETURNING username, name, email;")
    ChitterAccount.new(username: result[0]['username'], name: result[0]['name'], email: result[0]['email'])
  end
end

# if username == a username from .all then raise error, if not then insert into...