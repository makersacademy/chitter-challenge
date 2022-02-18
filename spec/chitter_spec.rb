require_relative '../lib/chitter'

describe Chitter do
  describe '#post' do
    it 'saves and returns the posted peep' do
      peep = Chitter.post("Hello, chitter!")
      expect(peep).to eq ("Hello, chitter!")
    end
  end
end