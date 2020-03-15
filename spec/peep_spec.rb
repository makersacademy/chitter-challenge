require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # add the test data
      peep = Peep.create(message:'peep test 1')
      Peep.create(message:'peep test 2')
      Peep.create(message:'peep test 3')

      peeps = Peep.all

      expect(peeps.length).to eq(3)
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq('peep test 1')

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      #time = Time.now
      peep = Peep.create(message: 'test peep message')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq(persisted_data['id'])
      expect(peep.message).to eq('test peep message')
      #expect(peep['message']).to eq('test peep message')
      #expect(peep['time']).to eq(time)
    end
  end
end
