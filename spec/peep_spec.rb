require 'peep'

describe '.all' do
  describe 'can see all peeps' do
    it 'returns all peeps sent' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('Hello');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hey');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hi');")

      peeps = Peep.all
      expect(peeps).to include "Hello"
      expect(peeps).to include "Hey"
      expect(peeps).to include "Hi"
    end
  end
end
