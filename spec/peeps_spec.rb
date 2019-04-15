require 'peeps'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(peep: 'Test', id: 1)

      expect(peep.message).to eq 'Test'
    end
  end


  describe '.all' do
      it 'gets all peeps' do
        peep = Peeps.create(peep: 'Test', id: 1)
        peeps = Peeps.all

        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.peep).to eq peep.peep
      end
    end
  end
