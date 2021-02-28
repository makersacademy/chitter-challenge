require './lib/peep.rb'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps in reverse chronological order' do
      PG.connect(dbname: 'chitter_test')

     # Add the test data
      Peep.create(peep: "This is my first peep")
      Peep.create(peep: "This is my second peep")
      peep3 = Peep.create(peep: "This is my third peep")

      list_of_peeps = Peep.all

      expect(list_of_peeps.length).to eq 3
      expect(list_of_peeps.first).to be_a Peep
      expect(list_of_peeps.first.id).to eq peep3.id
      expect(list_of_peeps.first.peep).to eq 'This is my third peep'
    end
  end
end
