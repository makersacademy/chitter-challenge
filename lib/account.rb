require 'pg'

class Account

  attr_reader :forename, :surname, :username, :email, :password, :account_id

  def initialize(forename:, surname:, username:, email:, password:, account_id:)
    @forename = forename
    @surname = surname
    @username = username
    @email = email
    @password = password
    @account_id = account_id
  end

  def self.create(forename:, surname:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec("INSERT INTO accounts (forename,surname,username,email,password) VALUES ('#{forename}','#{surname}','#{username}', '#{email}', '#{password}') RETURNING account_id, forename, surname, username, email, password;")

    Account.new(forename: result[0]['forename'], surname: result[0]['surname'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'], account_id: result[0]['account_id'])
  end
end
