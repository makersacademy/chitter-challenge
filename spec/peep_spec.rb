require './lib/models/peep'

describe Peep do 
  let(:user) { double(:user, uid: '1', time: '17/1/20 13:00', message: 'My test peep!' ) }
  let(:subject) { Peep }
  let(:subject2) { Peep.new(uid: '1', time: '17/1/20 13:00', message: 'My test peep!') }
  describe '#initialization' do
    it 'initializes an instance of a peep' do 
      expect(subject2.uid).to eq '1'
      expect(subject2.time).to eq '17/1/20 13:00'
      expect(subject2.message).to eq 'My test peep!'
    end
  end

  describe '.create' do
    it 'creates a peep entry in the database' do
      subject.create(user)
      expect(subject.all.last.uid).to eq '1'
    end
  end

  describe '.all' do
    it 'returns a list of all peeps' do
      expect(subject.all).to be_a Array
      expect(subject.all.last).to be_a Peep
    end
  end
  
end
  