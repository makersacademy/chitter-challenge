require 'peep'
require_relative 'database_helpers'

describe Peep do
  describe '#.all' do
    it 'returns a list of peeps' do

      peep = Peep.create('Name 1', 'Peep 1')
      Peep.create('Name 2', 'Peep 2')
      Peep.create('Name 3', 'Peep 3')
      
      p peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0]).to be_a Peep
      expect(peeps[0].id).to eq peep.id
      expect(peeps[0].display_name).to eq 'Name 1'
      expect(peeps[0].peep).to eq 'Peep 1'
      expect(peeps[1].display_name).to eq 'Name 2'
      expect(peeps[1].peep).to eq 'Peep 2'
      expect(peeps[2].display_name).to eq 'Name 3'
      expect(peeps[2].peep).to eq 'Peep 3'
    end
  end
  describe '#create' do
    it 'creates a new peep' do
      peep = Peep.create('test name', "test peep")
      persisted_data = persisted_data(table: 'peeps', id: peep.id)
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.display_name).to eq 'test name'
      expect(peep.peep).to eq 'test peep'
    end
  end
  
end