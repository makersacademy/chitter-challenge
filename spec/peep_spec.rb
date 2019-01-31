require 'peep'

describe Peep do
  describe '#all' do
    it 'Returns an array of hashes for each peep in the database' do
      expect(Peep.all).to include({"id" => "1", "message" => "Test Peep!"})
    end
  end
  describe '#add' do
    it 'Adds a peep to the database' do
      Peep.add("Hello World!")
      expect(Peep.all).to include({"id" => "2", "message" => "Hello World!"})
    end
  end

end
