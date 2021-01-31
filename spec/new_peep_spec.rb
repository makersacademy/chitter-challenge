require 'peep'

describe Peep do
  describe '.new_peep' do
    it 'saves a new peep' do
      connection = PG.connect(dbname: 'chitter_test')
      test_peep = Peep.new_peep(user_id: 1, peep: "hello world")

      expect(test_peep).to be_a Peep
      expect(test_peep.user_id).to eq '1'
      expect(test_peep.peep).to eq "hello world"
    end

    it 'saves new peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')
      first_peep = Peep.new_peep(user_id: 1, peep: "this is my first peep")
      second_peep = Peep.new_peep(user_id: 1, peep: "this is my second peep")

      expect(Peep.all_peeps.first.peep).to eq "this is my second peep"

    end
  end
end
