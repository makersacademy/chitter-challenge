require 'peep'
require 'database_helper'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      peep = Peep.create(message: 'My first peep')
      Peep.create(message: 'Hello')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'My first peep'
    end
  end


  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Test Peep')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'Test Peep'
    end
  end
end
