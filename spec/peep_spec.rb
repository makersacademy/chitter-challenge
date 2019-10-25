require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('test');")
      connection.exec("INSERT INTO peeps (peep) VALUES('testing');")

      peeps = Peep.all.join('').split(' - ')
      expect(peeps).to include('testing')
      expect(peeps).to include('test')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'new test')

      expect(Peep.all.join('').split(' - ')).to include 'new test'
    end
  end
end
