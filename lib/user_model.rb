require 'pg'
require_relative '../spec/db_test_setup'
require 'bcrypt'

class User
  def self.all
    results = DataBaseTestSetup.connection.exec('SELECT * FROM Users;')
    results.map do |each_user|
      each_user
    end
  end

  def self.create(fname:, lname:, email:, password:)
    hashed_password = BCrypt::Password.create(password)
    connection = DataBaseTestSetup.connection
    user = connection.exec("INSERT INTO USERS (firstname, lastname, email, password) VALUES('#{fname}','#{lname}','#{email}','#{hashed_password}') RETURNING id, firstname, lastname;")
    User.new(id: user[0]['id'], fname: user[0]['fname'], lname: user[0]['lname'])
  end

  attr_reader :id, :fname, :lname

  def initialize(id:, fname:, lname:)
    @id = id
    @fname = fname
    @lname = lname
  end
end
