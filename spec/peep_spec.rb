require 'peep'

describe Peep do

  let(:peep1) { Peep.new(1, 'Hello! There!') }
  let(:peep2) { Peep.new(1, 'Hello! There!') }
  let(:peep3) { Peep.new(2, 'Hello! There!') }

  describe '#initialise' do
    it 'has id and peep attributes' do
      expect(peep1.id).to eq 1
      expect(peep1.text).to eq 'Hello! There!'
    end
  end

  describe '#==' do
    it 'returns true if ids match' do
      expect(peep1).to eq peep2
    end

    it 'returns false if ids are different' do
      expect(peep1).not_to eq peep3
    end
  end

  describe '#all' do

    it 'returns peeps in reverse order' do
      peep1 = Peep.create('Ate ravioli today!')
      peep2 = Peep.create('Ran 5km!')
      expect(Peep.all.last).to eq peep1
    end
  end

end
