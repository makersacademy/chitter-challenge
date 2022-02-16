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
end
