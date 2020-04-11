require 'peep'
require_relative 'database_helpers'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      first_peep = Peep.create("First Peep")
      persisted_data = persisted_data(table: 'peeps', id: first_peep.id)

      expect(first_peep).to be_a Peep
      expect(first_peep.id).to eq persisted_data.first['id']
      expect(first_peep.peep).to eq persisted_data.first['peep']
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