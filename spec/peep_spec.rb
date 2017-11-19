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
    context 'when hashtahs present' do
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

  describe '#content=' do
    let(:userclass) { double(:userclass, first: :user) }
    subject { Peep.new(content: '@hello') }

    context 'when given content' do
      before(:each) { Object.any_instance.stub(:first).and_return(:user) }
      
      it 'sets mentioned users' do
        expect(subject.mentions).to eq [:user]
      end
    end
  end
end
