require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps in reverse order' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 1');")
      connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 2');")
      peeps = Peep.all

      expect(peeps).to include 'This is Peep 1'
      expect(peeps).to include 'This is Peep 2'
    end
  end

  describe '.create' do
    it 'adds a peep to the list' do
      Peep.create(text: 'This is Peep 1')

      expect(Peep.all).to include 'This is Peep 1'
    end
  end
end
