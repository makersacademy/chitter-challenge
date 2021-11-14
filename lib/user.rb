require 'pg'

class User
  attr_reader :email, :user_name, :password, :name

  def initialize(email, password, name, user_name)
    @name = name
    @user_name = user_name
    @email = email
    @password = password
  end

  def self.all
    connection = PG.connect(dbname: "chitter#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    result = connection.exec('SELECT * FROM chit_user;')
    result.map { |dbrow| dbrow['user_name'] }
  end
end
