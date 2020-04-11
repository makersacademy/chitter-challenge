require 'peep'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      # add test data
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (content) VALUES ('This is so cool');")
      connection.exec("INSERT INTO peeps (content) VALUES ('I am sending a peep');")
      connection.exec("INSERT INTO peeps (content) VALUES ('Isolation #COVID-19');")

      peeps = Peep.all

      expect(peeps).to include 'This is so cool'
      expect(peeps).to include 'I am sending a peep'
      expect(peeps).to include 'Isolation #COVID-19'
    end
  end
end