require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('Test peep text');")
      DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('Another test peep text');")
      peeps = Peep.all
      
      expect(peeps).to include "Test peep text"
      expect(peeps).to include "Another test peep text"
    end
  end

  describe '.create' do
    it 'adds a new peep to the database' do
      peep = Peep.create("New peep text")

      expect(peep).to be_a Peep
      expect(Peep.all.length).to eq 1
      
    end
  end
end
