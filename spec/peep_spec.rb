require_relative '../lib/peep'

describe Peep do

  describe ".find_by_id" do
    it "gets a peep by id" do
      user = create_test_user
      peep = Peep.create(peep: 'This is a test', user_id: user.id)
      persisted_peep = Peep.find_by_id(id: peep.id)

      expect(peep.peep).to eq persisted_peep.peep
    end

    it 'returns nil if there is no ID given' do
      expect(Peep.find_by_id(id: nil)).to eq nil
    end
  end

  # Interesting, after refactoring I get to the same test as above...
  # I will change this after some more thought.. or just remove one of the
  # tests
  describe '.create' do
    it 'creates a new peep' do
      user = create_test_user
      peep = Peep.create(peep: "Hello World!", user_id: user.id)
      persisted_peep = Peep.find_by_id(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_peep.id
      expect(peep.peep).to eq persisted_peep.peep
      expect(peep.user_id).to eq persisted_peep.user_id
    end

    it ' does not create a peep that is empty' do
      user = create_test_user
      peep = Peep.create(peep: "", user_id: user.id)
      expect(peep).to be_nil

    end
  end

  describe '.all' do
    it 'gets all the peeps in reverse chronological order' do
      user = create_test_user
      Peep.create(peep: "Wow, that's so cool", user_id: user.id)
      peep = Peep.create(peep: "The end is nigh", user_id: user.id) # This will be the first one returned
      
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.user_id).to eq peep.user_id
      # add in canned mock created_by...
      expect(peeps.first.peep).to eq "The end is nigh"
    end
  end
end
