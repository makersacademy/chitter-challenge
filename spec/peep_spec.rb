require 'peep'
require_relative 'database_helpers'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      first_peep = Peep.create("First Peep", '2020-04-11 10:52:57.960784', 'Bruce123')
      persisted_data = persisted_data(table: 'peeps', id: first_peep.id)

      expect(first_peep).to be_a Peep
      expect(first_peep.id).to eq persisted_data.first['id']
      expect(first_peep.peep).to eq persisted_data.first['peep']
      expect(first_peep.date).to eq persisted_data.first['date']
      expect(first_peep.peeper).to eq persisted_data.first['peeper']
    end
  end

  describe '.all' do
    it 'peeps can be views' do
      peep = Peep.create("First Peep", '2020-04-10 10:52:57.960784', 'Bruce123')
      Peep.create("Second Peep", '2020-04-11 10:52:57.960784', 'Bruce123')
   
      peeps = Peep.all
   
      expect(peeps.length).to eq 2
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.peep).to eq "First Peep"
      expect(peeps.last.peeper).to eq 'Bruce123'
    end
  end

end