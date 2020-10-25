require 'pg'

class ChitterAccount

  def self.all
    connection = PG.connect(dbname: 'chitter_accounts')
    rs = connection.exec(SELECT username FROM accounts)
    rs.map do |account|
      account['username']
    end
  end

  def self.create(username:, name:, email:, password:)
    connection = PG.connect(dbname: 'chitter_accounts')
    connection.exec("INSERT INTO accounts (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{password}') RETURNING username;")
  end
end