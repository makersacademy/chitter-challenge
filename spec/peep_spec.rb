require 'peep'
require_relative 'database_helpers'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      first_peep = Peep.create("First Peep", '2020-04-11 10:52:57.960784')
      persisted_data = persisted_data(table: 'peeps', id: first_peep.id)

      expect(first_peep).to be_a Peep
      expect(first_peep.id).to eq persisted_data.first['id']
      expect(first_peep.peep).to eq persisted_data.first['peep']
      expect(first_peep.date).to eq persisted_data.first['date']
    end
  end

  describe '.all' do
    it 'peeps can be views' do
      peep = Peep.create("First Peep", '2020-04-10 10:52:57.960784')
      Peep.create("Second Peep", '2020-04-11 10:52:57.960784')
   
      peeps = Peep.all
   
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "First Peep"
    end
  end

end