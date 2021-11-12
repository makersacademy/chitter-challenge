require 'pg'

require_relative '../lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps (regardless of log in status)' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO 'peeps' (content) VALUES ('this is a test, should be Ginny as user');")
      connection.exec("INSERT INTO 'peeps' (content) VALUES ('this is another test message, Ginny as user');")
      connection.exec("INSERT INTO 'peeps' (content) VALUES ('test message, Jon as user');")
      connection.exec("INSERT INTO 'peeps' (content) VALUES ('Grace as user');")

      peeps = Peep.all

      expect(peeps).to include 'this is a test, should be Ginny as user'
      expect(peeps).to include 'this is another test message, Ginny as user'
      expect(peeps).to include 'test message, Jon as user'
      expect(peeps).to include 'Grace as user'
    end
  end
end
