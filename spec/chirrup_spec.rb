require 'chirrup'

describe Chirrup do
  subject(:chirrup) { Chirrup.new(:content => 'Test message') }

  describe '#content' do
    it 'returns user input' do
      expect(chirrup.content).to eq('Test message')
    end
  end

end
