require 'pg'

class User
attr_reader :name, :user_name, :email_address
  def initialize(name, user_name,email_address)
    @name = name
    @user_name = user_name
    @email_address = email_address
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM userdetails;')
    result.map { |user| User.new(user['name'], user['user_name'], user['email']) }
  end

end