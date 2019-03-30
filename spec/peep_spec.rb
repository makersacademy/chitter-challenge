require 'peep'

describe Peep do
  describe '.all' do
    it 'returns Peepdeck' do
      connection = PG.connect(dbname: 'chitter_app_test')
      # add test data
      connection.exec("INSERT INTO chitter VALUES(1, 'My first peep');")

      peepdeck = Peep.all

      expect(peepdeck).to include 'My first peep'
    end
  end

  describe '.create' do
    it 'composes Peep and adds to Peepdeck' do
      Peep.create(peep: 'My second peep!')

      expect(Peep.all).to include 'My second peep!'
    end
  end
end
