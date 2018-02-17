require 'peep'

describe Peep do

  describe '.all' do
    it 'returns an array of peep instances' do
      peeps = Peep.all
      messages = peeps.map(&:message)
      expect(messages).to include 'test peep 1'
      expect(messages).to include 'test peep 2'
      expect(messages).to include 'test peep 3'
    end
  end

  describe '.add' do
    it 'adds a new row to the database' do
      Peep.add('adding a new peep')
      peeps = Peep.all
      messages = peeps.map(&:message)
      expect(messages).to include 'adding a new peep'
    end
  end

end
