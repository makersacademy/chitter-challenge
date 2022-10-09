require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/user.rb'
require 'pg'
require 'time'
require 'timecop'

RSpec.describe "User" do
  # before do
  #   Timecop.freeze
  #   @time = Time.now.strftime("%H:%M, %d %B")
  # end
  describe ".all" do
    it "Returns an array of users" do
      begin
        connection = PG.connect :dbname => 'chitter_test'
        connection.exec("INSERT INTO users (email, username, fullname, password) VALUES('testthis@gmail.com', 'myUserName', 'FirstName LastName', 'passw0rd')")
      rescue PG::Error => e
        p e.message
      ensure
        connection.close if connection
      end

      users = User.all
      expect(users.first.email).to eq('testthis@gmail.com')
      expect(users.first.username).to eq('myUserName')
      expect(users.first.fullname).to eq('FirstName LastName')
      expect(users.first.password).to eq('passw0rd')
    end
  end


  describe ".create" do
    it "Creates a user with an email, username, fullname and password" do
      #Updated tests will check if the username + email are unique
      # And encrypt the password
      User.create(email: 'test@example.com', username: 'apples', fullname: 'FirstName SecondName', password: 'PlzEncryptThis')
      users = User.all
      expect(users.first.email).to eq('test@example.com')
      expect(users.first.username).to eq('apples')
      expect(users.first.fullname).to eq('FirstName SecondName')
      expect(users.first.password).to eq('PlzEncryptThis')
    end

    it "Creates another user with an email, username, fullname and password" do
      #Updated tests will check if the username + email are unique
      # And encrypt the password
      User.create(email: 'secondtest@example.com', username: 'bananas', fullname: 'Billy SecondName', password: 'UnprotectedPassword')
      users = User.all
      expect(users.first.email).to eq('secondtest@example.com')
      expect(users.first.username).to eq('bananas')
      expect(users.first.fullname).to eq('Billy SecondName')
      expect(users.first.password).to eq('UnprotectedPassword')
    end



  end
end