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
  end
end
