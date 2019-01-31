require 'peep'

describe Peep do
  describe '#all' do
    it 'Returns an array of Peep objects for each peep in the database' do
      peeps = Peep.all
      expect(peeps[0].message).to eq("Test Peep!")
    end
  end
  describe '#add' do
    it 'Adds a peep to the database' do
      Peep.add("Hello World!")
      peeps = Peep.all
      expect(peeps[1].message).to eq("Hello World!")
    end
  end

end
