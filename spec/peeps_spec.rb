require 'peeps'
require 'database_helpers'

describe Peep do 
  describe "#all" do 
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(content: "This is the first test peep")
      Peep.create(content: "This is the second test peep")
      Peep.create(content: "This is the third test peep")
  
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq "This is the first test peep"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: "This is the first test peep")
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq "This is the first test peep"
    end
  end
end 
