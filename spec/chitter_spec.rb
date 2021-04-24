require 'chitter'

describe Chitter do

  describe '#.all method' do
    it 'can return all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('Test Peep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Peep Testing!');")
      peeps = Chitter.all
      expect(peeps).to include "Test Peep"
      expect(peeps).to include "Peep Testing!"
    end
  end

end
