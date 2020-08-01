require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      DatabaseConnection.setup('chitter_test')
      DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('Test peep text');")
      DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('Another test peep text');")
      peeps = Peep.all
      
      expect(peeps).to include "Test peep text"
      expect(peeps).to include "Another test peep text"
    end
  end
end
