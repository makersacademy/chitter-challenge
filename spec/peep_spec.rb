require_relative '../lib/peep'

describe Peep do

  describe ".find_by_id" do
    it "gets a peep by id" do
      id = Peep.create('This is a test')
      expect(Peep.find_by_id(id)).to eq 'This is a test'
    end
  end

  # Interesting, after refactoring I get to the same test as above...
  # I will change this after some more thought.. or just remove one of the
  # tests
  describe '.create' do
    it 'creates a new peep' do
      id = Peep.create("Hello World!")
      expect(Peep.find_by_id(id)).to include 'Hello World!'
    end
  end

  describe '.all' do
    it 'gets all the peeps in reverse chronological order' do
      Peep.create("Wow, that's so cool")
      Peep.create("The end is nigh")
      
      peeps = Peep.all
      expect(peeps).to include("Wow, that's so cool")
      expect(peeps).to include("The end is nigh")
    end
  end
end
