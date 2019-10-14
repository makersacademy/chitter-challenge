require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps in reverse order' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 1');")
      connection.exec("INSERT INTO peeps (text) VALUES('This is Peep 2');")
      peeps = Peep.all

      expect(peeps.first.text).to include 'This is Peep 1'
    end
  end

  describe '.create' do
    it 'adds a peep to the list' do
      peep = Peep.create(text: 'This is Peep 1')

      expect(peep.text).to include 'This is Peep 1'
    end
  end
end
