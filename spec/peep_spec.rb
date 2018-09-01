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

describe '.create' do
  describe 'can add a peep' do
    it 'returns a peep posted' do

      Peep.create("Hello peeps!")

      expect(Peep.all).to include "Hello peeps!"
    end
  end
end
