require 'pg'

class Account
  attr_reader :account_id, :name, :username, :email, :password

  def initialize(account_id:, name:, username:, email:, password:)
    @account_id = account_id
    @name = name
    @username = username
    @email = email
    @password = password
  end
    
  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
        # The first argument is our SQL query template
        # The second argument is the 'params' referred to in exec_params
        # $1 refers to the first item in the params array
    result = conn.exec_params("INSERT INTO accounts (name, username, email, password) 
    VALUES ($1, $2, $3, $4) RETURNING account_id, name, username, email, password;" [name, username, email, password])
    Account.new(account_id: result[0]['account_id'], name: result[0]['name'], 
      username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end
end 
