require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      con = PG.connect(dbname: 'chitter_test')

      con.exec("INSERT INTO PEEPS (url) VALUES ('Hello chitter users');")
      con.exec("INSERT INTO PEEPS (url) VALUES ('This is my first peep');")
      
      peeps = Peeps.all

      expect(peeps).to include 'Hello chitter users'
      expect(peeps).to include 'This is my first peep'
    end
  end
end
