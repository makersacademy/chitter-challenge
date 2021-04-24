require './app/models/peep'

describe Peep do

  describe '#initialize' do
    context 'initializing the class' do
      it 'creates an instance of the class' do
        peep = Peep.new('bobross', 'new peep')
        expect(peep.username).to eq 'bobross'
        expect(peep.status).to eq 'new peep'
      end
    end
  end

  describe '.all' do
    context 'a tweet instance is created' do
      it 'returns all initialized peeps' do
        peep = Peep.new('bobross', 'new peep')
        expect(Peep.all.last).to eq peep
      end
    end
  end
end
