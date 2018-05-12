require 'peep'

describe Peep do
  subject(:peep) { Peep.new('Yoncé', '12.34', 'I am hungry')}
  describe '#initialize' do
    it 'should respond to username with argument' do
      expect(peep.username).to eq 'Yoncé'
    end
    it 'should respond to time with argument' do
      expect(peep.time).to eq '12.34'
    end
    it 'should respond to text with argument' do
      expect(peep.text).to eq 'I am hungry'
    end
  end
end
