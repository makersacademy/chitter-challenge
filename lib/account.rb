require 'pg'

class Account


  attr_reader :id, :email, :password, :name

  def initialize(id:,email:,password:,name:)
    @id = id
    @email = email
    @password = password
    @name = name
  end

  def self.create_account(email:,password:,name:)
    row_hash = database.exec("INSERT INTO user_accounts (email,password,name)
     VALUES ('#{email}','#{password}','#{name}') RETURNING id,email,name,password").first
    Account.new(id:row_hash['id'],email:row_hash['email'],password:row_hash['password'],name:row_hash['name'])
  end

  def self.account_identifier(email:,password:)
    account = database.exec("SELECT * FROM user_accounts WHERE email = '#{email}' AND password = '#{password}'").first
    Account.new(id:account['id'],email:account['email'],password:account['password'],name:account['name'])
  end

  private

  def self.database
    ENV['RACK_ENV'] == 'test' ? PG.connect(dbname:'chitter_test') : PG.connect(dbname:'chitter')
  end

end
