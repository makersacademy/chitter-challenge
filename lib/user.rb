require 'pg'
require_relative '../spec/web_helpers.rb'

class User

  attr_reader :id, :email, :password, :logged_in

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

  def self.check_password(email, password)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peep_manager_test")
    else
      connection = PG.connect(dbname: "peep_manager")
    end

    result = connection.exec("SELECT password FROM users WHERE email = '#{email}';")
    result[0]['password'] == password
  end

  # def self.all
  #   if ENV["ENVIRONMENT"] == "test"
  #     connection = PG.connect(dbname: "peep_manager_test")
  #   else
  #     connection = PG.connect(dbname: "peep_manager")
  #   end

  #   result = connection.exec("SELECT * FROM users;")
  #   result.map do |user|
  #     User.new(user["id"], user["email"], user["password"])
  #   end
  # end
end