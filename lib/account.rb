require 'pg'
require_relative './chitter_connection'

class Account

  def self.new_account(name, username, email, password)
    ChitterConnection.query("INSERT INTO accounts(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}');")
  end

  def self.load_account(username, password)
    return false unless ChitterConnection.query("SELECT name, username FROM accounts WHERE password='#{password}' AND username='#{username}';")
  end
end
