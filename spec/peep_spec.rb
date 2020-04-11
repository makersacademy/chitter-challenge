require 'peep'
require_relative 'database_helpers'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      peep = Peep.create("First Peep")
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq "First Peep"
    end
  end

  describe '.all' do
    it 'peeps can be views' do
      Peep.create("First Peep")
      Peep.create("Second Peep")
      expect(Peep.all).to eq ["First Peep", "Second Peep"]
    end
  end

end