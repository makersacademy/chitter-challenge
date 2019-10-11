require 'pg'

class Account
attr_reader :email, :password

 def initialize(email:, password:)
   @email = email
   @password = password
 end

  def self.create(email:, password:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Account_test')
    else
      connection = PG.connect(dbname: 'Account')
    end
    result = connection.exec("INSERT INTO accounts (email, password) VALUES('#{email}', '#{password}') RETURNING email, password")
    Account.new(email: result[0]['email'], password: result[0]['password'])
  end
end
