require 'peep'
require 'web_helpers'
# require 'pg'

describe Peep do
  describe '.all' do
    it 'returns all peeps in an array' do
      peep_1 = Peep.create(username: 'Finn', peep: 'Mathematical!')
      peep_2 = Peep.create(username: 'Jake', peep: 'Making bacon pancakes')
      peep_3 = Peep.create(username: 'Beemo', peep: 'Yay!')
      expected_peeps = [
        peep_1,
        peep_2,
        peep_3
      ]
      expect(Peep.all).to eq expected_peeps
    end
  end

      # connection = PG.connect(dbname: 'chitter_test')
      
  #     peep_1 = Peep.create(peep: "Mathematical!")
  #     # peep_2 = Peep.create(peep: "Bacon pancakes!")

  #     expected_peeps = [
  #       peep_1
  #       # peep_2
  #     ]

  #     expect(Peep.all).to eq expected_peeps
  #   end
  # end

  # describe '.create' do
  #   it 'creates a new peep' do
  #     peep = Peep.create(peep: "testing testing")
  #     expect(Peep.all).to include peep
  #   end
  # end

  describe '#==' do
    it 'matches 2 peeps if their IDs are identical' do
      peep_1 = Peep.new(1, 'foo', 'bar', 'shoe' )
      peep_2 = Peep.new(1, 'boo', 'far', 'moo')

      expect(peep_1).to eq peep_2
    end
  end
end
