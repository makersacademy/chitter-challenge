
require 'peep'

describe Peep do
  describe '.new_peep' do
    it 'saves a new peep' do
      test_peep = Peep.new_peep(username: 'dude', peep: "hi")

      expect(test_peep).to be_a Peep
      expect(test_peep.username).to eq 'dude'
      expect(test_peep.peep).to eq "hi"
    end

    it 'saves new peeps in reverse chronological order' do
      Peep.new_peep(username: 'dude', peep: "this is my first peep")
      second_peep = Peep.new_peep(username: 'dude', peep: "this is my second peep")

      expect(Peep.all_peeps.first.peep).to eq second_peep.peep
    end
  end

  describe '.peep_username' do
    it 'returns the name of the peeper' do
      peeper = Users.sign_up(username: 'dude',
                             firstname: 'Someone',
                             secondname: 'Something',
                             email: 'Karsten@makersacademy.com')
      test_peep = Peep.new_peep(username: peeper.username, peep: "hi")

      expect(test_peep.username).to eq peeper.username
    end
  end
end