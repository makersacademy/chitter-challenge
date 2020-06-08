require 'pg'

class ChitterAccount
  attr_reader :username, :name

  def initialize(name, username, email, password)
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.sign_up(name, username, email, password)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec("INSERT INTO chitter_accounts (name,username,email,password) VALUES('#{name}','#{username}','#{email}','#{password}')")

    ChitterAccount.new(name, username, email, password)

  end
end


# username = connection.exec("SELECT username FROM chitter_accounts;")
# username.map { |user| user["username"] }
