require 'pg'

class Account
  ENV['RACK_ENV'] == 'test' ? @@chitter_database = PG.connect(dbname:'chitter_test') : @@chitter_database = PG.connect(dbname:'chitter')

  attr_reader :id, :email, :password, :name

  def initialize(id:,email:,password:,name:)
    @id = id
    @email = email
    @password = password
    @name = name
  end

  def self.create_account(email:,password:,name:)
    row_hash = @@chitter_database.exec("INSERT INTO user_accounts (email,password,name)
     VALUES ('#{email}','#{password}','#{name}') RETURNING id,email,name,password").first
    Account.new(id:row_hash['id'],email:row_hash['email'],password:row_hash['password'],name:row_hash['name'])
  end

end
