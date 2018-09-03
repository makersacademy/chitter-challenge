require './lib/database_connection'
require './setup_database_connection'

class Account
  attr_reader :account_id, :username
  
  def initialize(account_id, name, username, password)
    @account_id = account_id
    @name = name
    @username = username
    @password = password
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM accounts ORDER BY id')
    result.map do |account|
      Account.new(account['id'], account['acc_name'], account['username'], account['pswrd'])
    end
  end

  def self.create(name, username, password)
    rs = DatabaseConnection.query("INSERT INTO accounts (acc_name, username, pswrd) VALUES ('#{name}', '#{username}', '#{password}') RETURNING id, acc_name, username, pswrd;")
    Account.new(rs[0]['id'], rs[0]['acc_name'], rs[0]['username'], rs[0]['pswrd'])
  end

# def self.user_id(username)
#   rs = DatabaseConnection.query("SELECT * FROM accounts WHERE acc_name = '#{username}';")
# end

end
