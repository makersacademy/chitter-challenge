require 'pg'

require_relative '../lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps (regardless of log in status)' do
      # connect to test database
      connection = PG.connect(dbname: 'chitter_test')

      # load in database info
      # chit_user table
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('test@test.com', 'test', 'Ginny', 'ginnyamazed');")
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('1test@test.com', 'test', 'Jon', 'JonAZ');")
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('2test@test.com', 'test', 'Grace', 'doglover');")
      # connection.exec("INSERT INTO chit_user (email, password, name, user_name) VALUES ('3test@test.com', 'test', 'Jay', 'amorthian');")
      # # peeps table
      connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (1, 'this is a test, should be Ginny as user', '2021-08-09 22:07:10');")
      connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (1, 'this is another test message, Ginny as user', '2021-08-09 21:50:40');")
      connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (4, 'test message, Jon as user', '2021-10-10 03:57:40');")
      connection.exec("INSERT INTO peeps (chit_user_id, content, timestamp) VALUES (3, 'Grace as user', '2021-08-09 13:57:40');")

      peeps = Peep.all

      expect(peeps).to include (Peep.new(@name="Jon", @user_name='JonAZ', @timestamp='2021-10-10 03:57:40', @content='test message, Jon as user'))
      expect(peeps).to include(Peep.new(@name='Ginny', @user_name='ginnyamazed', @timestamp='2021-08-09 22:07:10', @content='this is a test, should be Ginny as user'))
      # expect(peeps).to include "@name='Ginny', @user_name='ginnyamazed', @timestamp='2021-08-09 21:50:40', @content='this is another test message, Ginny as user'"
      # expect(peeps).to include "@name='Grace', @user_name='doglover', @timestamp='2021-08-09 13:57:40', @content='Grace as user'"
    end
  end
end

# TODO: fix syntax so that test passes (it passed before new iteration??)
