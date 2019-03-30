require 'chitter'
describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      Chitter.create(content: "peep1")
      Chitter.create(content: "peep2")
      Chitter.create(content: "peep3")
      peeps = Chitter.all

      expect(peeps).to include("peep1")
      expect(peeps).to include("peep2")
      expect(peeps).to include("peep3")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Chitter.create(content: 'test peep')

      expect(Chitter.all).to include 'test peep'
    end
  end
end
