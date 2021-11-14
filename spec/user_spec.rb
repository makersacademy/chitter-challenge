require 'PG'
require_relative '../lib/user'

describe User do
  describe '.all' do
    it 'returns all chit users' do
      # connect to database
      connection = PG.connect(dbname: 'chitter_test')

      # load in database info
      # chit_user table
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('test@test.com', 'test', 'Ginny', 'ginnyamazed');")
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('1test@test.com', 'test', 'Jon', 'JonAZ');")
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('2test@test.com', 'test', 'Grace', 'doglover');")
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('3test@test.com', 'test', 'Jay', 'amorthian');")

      chit_users = User.all

      expect(chit_users).to include ("amorthian")
      # expect(chit_users).to include "3test@test.com, test, Jay, amorthian"
      # expect(peeps).to include "
      # expect(peeps).to include "@name='Grace', @user_name='doglover', @timestamp='2021-08-09 13:57:40', @content='Grace as user'"
    end
  end
end
