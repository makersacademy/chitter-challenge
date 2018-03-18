class Account

  def self.new_account(name, username, email, password)
    ChitterConnection.query("INSERT INTO accounts(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}');")
  end
end
