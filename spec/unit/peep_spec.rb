require 'peep'
require_relative '../database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(peep: 'This is my first bookmark!', user_id: 4)
      Peep.create(peep: 'This is my second bookmark', user_id: 5)
      
      peeps = Peep.all
    
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.user_id).to eq 4
      expect(peeps.first.id).to eq peep.id 
      expect(peeps.first.peep).to eq 'This is my first bookmark!'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: "My first peep!", user_id: 10)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.user_id).to eq 10
      expect(peep.peep).to eq 'My first peep!'
    end
  end
end
