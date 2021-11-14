require 'pg'

require_relative '../lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps (regardless of log in status)' do
      # connect to test database
      connection = PG.connect(dbname: 'chitter_test')

      # load in database info
      # chit_user table
      connection.exec("INSERT INTO chit_user VALUES (1, 'test@test.com', 'test', 'Ginny', 'ginnyamazed');")
      connection.exec("INSERT INTO chit_user VALUES (2, '1test@test.com', 'test', 'Jon', 'JonAZ');")
      connection.exec("INSERT INTO chit_user VALUES (3, '2test@test.com', 'test', 'Grace', 'doglover');")
      connection.exec("INSERT INTO chit_user VALUES (4, '3test@test.com', 'test', 'Jay', 'amorthian');")
      # peeps table
      connection.exec("INSERT INTO peeps VALUES (1, 1, 'this is a test, should be Ginny as user', '2021-08-09 22:07:10');")
      connection.exec("INSERT INTO peeps VALUES (2, 1, 'this is another test message, Ginny as user', '2021-08-09 21:50:40');")
      connection.exec("INSERT INTO peeps VALUES (3, 2, 'test message, Jon as user', '2021-10-10 03:57:40');")
      connection.exec("INSERT INTO peeps VALUES (4, 3, 'Grace as user', '2021-08-09 13:57:40');")

      peeps = Peep.all

      expect(peeps).to include "content"=>"this is a test, should be Ginny as user",
                               +  "name"=>"Ginny",
                               +  "timestamp"=>"2021-08-09 22:07:10",
                               +  "user_name"=>"ginnyamazed"
      expect(peeps).to include "content"=>"this is another test message, Ginny as user",
                               +  "name"=>"Ginny",
                               +  "timestamp"=>"2021-08-09 21:50:40",
                               +  "user_name"=>"ginnyamazed"
      expect(peeps).to include "content"=>"test message, Jon as user",
                               +  "name"=>"Jon",
                               +  "timestamp"=>"2021-10-10 03:57:40",
                               +  "user_name"=>"JonAZ"
      expect(peeps).to include "content"=>"Grace as user",
                               +  "name"=>"Grace",
                               +  "timestamp"=>"2021-08-09 13:57:40",
                               +  "user_name"=>"doglover"
    end
  end
end
