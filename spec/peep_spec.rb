
require 'peep'

describe Peep do
  describe '.new_peep' do
    it 'creates a new peep' do
      test_peep = Peep.new_peep(username: 'dude', peep: "hi")

      expect(test_peep).to be_a Peep
      expect(test_peep.username).to eq 'dude'
      expect(test_peep.peep).to eq "hello world"
    end

    it 'saves new peeps in reverse chronological order' do
      Peep.new_peep(username: 'dude', peep: "hi")
      second_peep = Peep.new_peep(username: 'dude', peep: "hi")

      expect(Peep.all_peeps.first.peep).to eq second_peep.peep
    end
  end
end