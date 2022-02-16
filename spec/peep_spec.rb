require_relative '../lib/peep'

describe Peep do

  describe ".find_by_id" do
    it "gets a peep by id" do
      peep = Peep.create('This is a test')
      persisted_peep = Peep.find_by_id(peep.id)

      expect(peep.peep).to eq persisted_peep.peep
    end
  end

  # Interesting, after refactoring I get to the same test as above...
  # I will change this after some more thought.. or just remove one of the
  # tests
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create("Hello World!")
      persisted_peep = Peep.find_by_id(peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_peep.id
      expect(peep.peep).to eq persisted_peep.peep
    end
  end

  describe '.all' do
    it 'gets all the peeps in reverse chronological order' do
      Peep.create("Wow, that's so cool")
      peep = Peep.create("The end is nigh") # This will be the first one returned
      
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      # add in canned mock created_by...
      expect(peeps.first.peep).to eq "The end is nigh"
    end
  end
end
