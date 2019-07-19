require 'peep'

describe Peep do
  describe '#all' do
    xit 'returns all peeps' do

        connection = PG.connect(dbname: 'chitter')

        # Add the test data
        peep = Peep.create(peep: 'Test peep', time: '2019-07-16')
        Peep.create(peep: 'Second test peep', time: '2019-07-17')
        Peep.create(peep: 'Third test peep', time: '2019-07-18')

        peeps = Peep.all

        expect(peeps.length).to eq 3
        expect(peeps.first).to be_a Peep
        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.peep).to eq "Test peep"
        expect(peeps.first.time).to eq '2019-07-16 00:00:00'
    end
  end
end
