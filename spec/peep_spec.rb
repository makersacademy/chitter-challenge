require './app/models/peep'

describe Peep do
  describe '#handles' do
    context 'when handles present' do
      let(:peep) { Peep.new }
      
      it 'returns list of user handles' do
        expect(peep.handles('@a @b')).to eq ['@a', '@b']
      end
    end

    context 'when no handles present' do
      let(:peep) { Peep.new }
      
      it 'returns list of user handles' do
        expect(peep.handles('hello no-one')).to eq []
      end
    end
  end

  describe '#hashtags' do
    context 'when hashtags present' do
      let(:peep) { Peep.new }
      
      it 'returns list of hastags' do
        expect(peep.hashtags('#a #b')).to eq ['#a', '#b']
      end
    end

    context 'when no handles present' do
      let(:peep) { Peep.new }
      
      it 'returns list of user handles' do
        expect(peep.hashtags('hello no-one')).to eq []
      end
    end
  end
end
