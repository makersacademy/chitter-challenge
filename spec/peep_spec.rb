require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
        connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(170));")
      connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 1');")
      connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 2');")
      peeps = Peep.all

      expect(peeps).to include 'This is Peep 1'
      expect(peeps).to include 'This is Peep 2'
    end
  end
end
