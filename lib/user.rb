require 'pg'

class User
  attr_reader :email, :user_name, :password, :name, :id

  def initialize(name, user_name, email, password, id)
    @name = name
    @user_name = user_name
    @email = email
    @password = password
    @id = id
  end

  def self.all
    connection = PG.connect(dbname: "chitter#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    result = connection.exec('SELECT * FROM chit_user;')
    result.map { |dbrow| dbrow['user_name'] }
  end

  def self.create(name, user_name, email, password)
    connection = PG.connect(dbname: "chitter#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    connection.exec("INSERT INTO chit_user (name, user_name, email, password) VALUES ('#{name}', '#{user_name}', '#{email}', '#{password}') RETURNING name, user_name, email, password, chit_user_id")
    session[:user_id] = connection.exec("SELECT chit_user_id FROM chit_user WHERE user_name =  '#{user_name}' AND password = '#{password}') ")

    # User.new(result[-1]['id'], result[-1]['name'], result[-1]['user_name'], result[-1]['email'], result[-1]['password'])

  end
end
