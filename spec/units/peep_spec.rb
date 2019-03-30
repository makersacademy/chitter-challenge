require './lib/peep.rb'
require './spec/entry_helper.rb'

describe Peep do
  describe '.create' do
    it 'creates a peep on the chitter' do
        peep = Peep.create(peep: 'My first peep')
        entry_in_database = entry_in_database(id: peep.id)

        expect(peep).to be_a Peep
        expect(peep.id).to eq entry_in_database.first['id']
        expect(peep.peep).to eq 'My first peep'

        expect(peep.timestamp).to be_kind_of(Time)
    end
  end
end