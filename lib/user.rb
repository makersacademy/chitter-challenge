require 'pg'
require_relative '../spec/web_helpers.rb'

class User

  attr_reader :id, :email, :password, :logged_in, :user

  def initialize(id, email, password, logged_in = false)
    @id = id
    @email = email
    @password = password
    @logged_in = logged_in
  end

  def self.create(email, password)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peep_manager_test")
    else
      connection = PG.connect(dbname: "peep_manager")
    end

    result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email, password;")

    User.new(result[0]["id"], result[0]["email"], result[0]["password"])
  end


  def self.check_password(email, password)

    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peep_manager_test")
    else
      connection = PG.connect(dbname: "peep_manager")
    end


    result = connection.exec("SELECT password FROM users WHERE email = '#{email}';")
    result[0]['password'] == password
  end

  def self.log_in(email, password)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peep_manager_test")
    else
      connection = PG.connect(dbname: "peep_manager")
    end

    if User.check_password(email, password)
      result = connection.exec("SELECT * FROM users WHERE email = '#{email}';")
      @user = User.new(result[0]["id"], result[0]["email"], result[0]["password"], true)
    else
      return "The email or password is incorrect"
    end
  end

  def self.show
    @user
  end

  def self.log_out
    @user = nil
  end
end