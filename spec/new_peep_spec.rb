require 'peep'

describe Peep do
  describe '.new_peep' do
    it 'saves a new peep' do
      test_peep = Peep.new_peep(username: 'charliecodes', peep: "hello world")

      expect(test_peep).to be_a Peep
      expect(test_peep.username).to eq 'charliecodes'
      expect(test_peep.peep).to eq "hello world"
    end

    it 'saves new peeps in reverse chronological order' do
      Peep.new_peep(username: 'charliecodes', peep: "this is my first peep")
      second_peep = Peep.new_peep(username: 'charliecodes', peep: "this is my second peep")

      expect(Peep.all_peeps.first.peep).to eq second_peep.peep
    end
  end

  describe '.peep_username' do
    it 'returns the name of the peeper' do
      peeper = Users.sign_up(username: 'charliecodes',
                             firstname: 'Charlie',
                             secondname: 'fischer',
                             email: 'charlie@makersacademy.com',
                             password: 'password')
      test_peep = Peep.new_peep(username: peeper.username, peep: "hello world")

      expect(test_peep.username).to eq peeper.username
    end
  end
end
