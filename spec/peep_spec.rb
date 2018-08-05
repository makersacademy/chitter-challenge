require 'peep'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns all peeps in an array' do
      connection = PG.connect(dbname: 'chitter_test')
      
      peep_1 = Peep.create(peep: "Mathematical!")
      # peep_2 = Peep.create(peep: "Bacon pancakes!")

      expected_peeps = [
        peep_1
        # peep_2
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: "testing testing")
      expect(Peep.all).to include peep
    end
  end

  describe '#==' do
    it 'matches 2 peeps if their IDs are identical' do
      bookmark_1 = Bookmark.new(1, 'foo', 'bar', 'shoe' )
      bookmark_2 = Bookmark.new(1, 'boo', 'far', 'moo')

      expect(bookmark_1).to eq bookmark_2
    end
  end
end
