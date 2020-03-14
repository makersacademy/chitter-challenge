require 'peep'

describe Peep do
  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # add the test data
      Peep.create(message:'peep test 1')
      Peep.create(message:'peep test 2')
      Peep.create(message:'peep test 3')

      peeps = Peep.all

      expect(peeps).to include('peep test 1')
      expect(peeps).to include('peep test 2')
      expect(peeps).to include('peep test 3')

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'test peep message')

      expect(Peep.all).to include('test peep message')
    end
  end
end
