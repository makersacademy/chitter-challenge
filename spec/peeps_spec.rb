require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Wow it was hot yesterday...');")
      connection.exec("INSERT INTO peeps (message) VALUES('Busy doing some coding today');")
      connection.exec("INSERT INTO peeps (message) VALUES('Heading to the pub later!');")

      peeps = Peeps.all
      expect(peeps).to include 'Wow it was hot yesterday...'
      expect(peeps).to include 'Busy doing some coding today'
      expect(peeps).to include 'Heading to the pub later!'
    end
  end
end
