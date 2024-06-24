require 'PG'
require_relative '../lib/user'

describe User do
  describe '.all' do
    it 'returns all chit users' do

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

  describe '.create' do
      it 'creates a new chitter user' do
        user5 = User.create('user18', 'user18', '18test@test.com', 'test')


        expect(User.all).to include 'user18'
        # expect(user5.name).to eq 'user18'
        # expect(user5.user_name).to eq 'user18'
        # expect(user5.email).to eq '18test@test.com'
        # expect(user5.password).to eq 'test'
        # expect(user5.id). to eq user5_data['id']
      end
  end
end


