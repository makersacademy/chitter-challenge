require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      output = peeps.map(&:message)
      expect(output).to include("My 0th test peep")
      expect(output).to include("Another test peep")
      expect(output).to include("The last test peep")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'New peep')
      peeps = Peep.all
      output = peeps.map(&:message)
      expect(output).to include 'New peep'
    end
  end
end
