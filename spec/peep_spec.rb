require_relative '../lib/peep.rb'

describe Peep do 
  subject(:peep) { described_class.new("lola", "lololo123", "hello") }

  describe '#name' do
    it 'returns the name' do
      expect(peep.name).to eq "lola"
    end
  end

  describe '#username' do
    it 'returns the username' do
      expect(peep.username).to eq "lololo123"
    end
  end

  describe '#content' do
    it 'returns the content' do
      expect(peep.content).to eq "hello"
    end
  end
  
end