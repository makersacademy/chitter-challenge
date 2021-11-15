require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # add test data and wrapping return data in an object
      peep = Peep.create(text: 'Hello I am a peep!')
      Peep.create(text: 'I too am a peep!')

      peeps = Peep.all
    
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'Hello I am a peep!'
    end
  end

  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create(text: 'My first peep!')
      persisted_data = persisted_data(id: peep.id)
      # expect(Peep.all).to include 'My first peep!'
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'My first peep!'
    end
  end

end
