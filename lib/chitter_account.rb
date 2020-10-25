require 'pg'

class ChitterAccount
  attr_reader :name, :username, :email

  def initialize (name:, username:, email:)
    @name = name
    @username = username
    @email = email
  end
    
  def self.all
    database_connection
    rs = @connection.exec("SELECT username, name, email FROM accounts;")
    rs.map do |account|
      ChitterAccount.new(name: account['name'], username: account['username'], email: account['email'])
    end
  end

  def self.create(username:, name:, email:, password:)
    database_connection   
    if username_and_email_unique?(username, email)
      result = @connection.exec("INSERT INTO accounts (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{password}') RETURNING username, name, email;")
      ChitterAccount.new(username: result[0]['username'], name: result[0]['name'], email: result[0]['email'])
    else
      nil
    end
  end

  private

  def self.username_in_use?(username)
    database_connection
    result = @connection.exec("SELECT username FROM accounts WHERE username='#{username}';")
    result.map { |row| row['username'] }.first.nil?
  end

  def self.email_not_in_use?(email)
    database_connection
    result = @connection.exec("SELECT email FROM accounts WHERE email='#{email}';")
    result.map { |row| row['email'] }.first.nil?  
  end

  def self.username_and_email_unique?(username, email)
    username_in_use?(username) && email_not_in_use?(email)
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_accounts_test')
    else
      @connection = PG.connect(dbname: 'chitter_accounts')
    end
  end    
end

