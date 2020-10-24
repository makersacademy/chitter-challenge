require 'Peep'

describe Peep do
    describe '#all' do
      it 'returns all peeps' do
        Peep.create(peep_text: 'My first peep')
        Peep.create(peep_text: 'My second peep')
        peeps = Peep.all

        expect(peeps).to include("My first peep")
        expect(peeps).to include("My second peep")
      end
    end

    describe '#create' do
      it 'creates a new peep' do
        Peep.create(peep_text: 'My peep today')
        expect(Peep.all).to include 'My peep today'
  end
end
end
