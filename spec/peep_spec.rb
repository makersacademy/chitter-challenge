require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.create("This is my first peep")
      expect(Peep.all).to include ("This is my first peep")
      # expect(peeps).to include("This is my second peep")
      # expect(peeps).to include("This is my third peep")
    end
  end

  describe '.create' do
    xit 'creates a new peep' do
      Peep.create(content: 'This is a test')

      expect(Peep.all).to include 'This is a test'
    end
  end

  describe '.create' do
    xit 'creates a new peep and shows the timestamp' do
      Peep.create(content: 'This is a test')

      expect(Peep.all).to include 'This is a test'
    end
  end

end
