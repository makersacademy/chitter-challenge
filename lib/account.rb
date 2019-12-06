class Account

  attr_reader :id, :username

  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.create(username, email, password)
    database_selector

    result = @connection.exec("INSERT INTO accounts(username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username")
    Account.new(result[0]['id'], result[0]['username'])
  end

  def self.new_account
    database_selector

    result = @connection.exec("SELECT id, username FROM accounts ORDER BY id DESC LIMIT 1")
    Account.new(result[0]['id'], result[0]['username'])
  end  

  private

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'message_database_test')
    else
      @connection = PG.connect(dbname: 'message_database')
    end
  end

end