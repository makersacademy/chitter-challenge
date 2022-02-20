require_relative '../lib/chitter'

describe Chitter do
  describe '#post' do
    it 'saves and returns the posted peep' do
      peep = Chitter.post("Hello, chitter!")
      expect(peep).to eq ("Hello, chitter!")
    end
  end

  describe '#list' do
    it 'lists all the posted peeps' do
      Chitter.post("First post")
      Chitter.post("Second post")
      expect(Chitter.list).to include("First post")
      expect(Chitter.list).to include("Second post")
    end
  end
end