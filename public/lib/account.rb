require 'bcrypt'

class Account

  attr_reader :id, :username

  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.create_instance(id, username)
    @account = Account.new(id, username)
  end

  def self.instance
    @account
  end

  def self.create(username, email, password)
    encrypted_password = BCrypt::Password.create(password)
    database_selector
    result = @connection.exec("INSERT INTO accounts(username, email, password) 
    VALUES('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username")
    Account.new(result[0]['id'], result[0]['username'])
  end

  def self.email_exists?(email)
    database_selector
    result = @connection.exec("SELECT email FROM accounts WHERE email = '#{email}'")
    true if result.ntuples.positive?
  end

  def self.username_exists?(username)
    database_selector
    result = @connection.exec("SELECT username FROM accounts WHERE username = '#{username}'")
    true if result.ntuples.positive?
  end

  def self.new_account
    database_selector

    result = @connection.exec("SELECT id, username FROM accounts ORDER BY id DESC LIMIT 1")
    Account.new(result[0]['id'], result[0]['username'])
  end  

  def self.get_account_details(username)
    database_selector

    result = @connection.exec("SELECT * FROM accounts WHERE username='#{username}'")
    [result[0]['username'], result[0]['email']]
  end

  def self.log_in(username, password)
    database_selector
    result = @connection.exec("SELECT id, username, password FROM accounts WHERE username = '#{username}'")
    Account.create_instance(result[0]['id'], result[0]['username'])
    true if BCrypt::Password.new(result[0]['password']) == password
    
  end

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'message_database_test')
    else
      @connection = PG.connect(dbname: 'message_database')
    end
  end

  private_class_method :database_selector

end
