require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/user.rb'
require 'pg'
require 'time'
require 'timecop'

def reset_tables
  seeds = File.read('/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/db/Real_Seeds/chitter_seeds.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'chitter_test'})
  connection.exec(seeds)
end

RSpec.describe "User" do
  before(:each) do
    reset_tables
  end
  describe ".all" do
    it "Returns an array of users" do
      # begin
      #   connection = PG.connect :dbname => 'chitter_test'
      #   connection.exec("INSERT INTO users (email, username, fullname, password) VALUES('testthis@gmail.com', 'myUserName', 'FirstName LastName', 'passw0rd')")
      # rescue PG::Error => e
      #   p e.message
      # ensure
      #   connection.close if connection
      # end

      users = User.all
      expect(users.first.email).to eq('peppermint@tea.com')
      expect(users.first.username).to eq('peppermint1990')
      expect(users.first.fullname).to eq('Peppermint Tea')
      expect(users.first.password).to eq('PePPERM1nt')
    end
  end


  describe ".create" do
    it "Creates a user with an email, username, fullname and password" do
      #Updated tests will check if the username + email are unique
      # And encrypt the password
      User.create(email: 'test@example.com', username: 'apples', fullname: 'FirstName SecondName', password: 'PlzEncryptThis')
      users = User.all
      expect(users.last.email).to eq('test@example.com')
      expect(users.last.username).to eq('apples')
      expect(users.last.fullname).to eq('FirstName SecondName')
      expect(users.last.password).to eq('PlzEncryptThis')
    end

    it "Creates another user with an email, username, fullname and password" do
      #Updated tests will check if the username + email are unique
      # And encrypt the password
      User.create(email: 'secondtest@example.com', username: 'bananas', fullname: 'Billy SecondName', password: 'UnprotectedPassword')
      users = User.all
      expect(users.last.email).to eq('secondtest@example.com')
      expect(users.last.username).to eq('bananas')
      expect(users.last.fullname).to eq('Billy SecondName')
      expect(users.last.password).to eq('UnprotectedPassword')
    end



  end
end