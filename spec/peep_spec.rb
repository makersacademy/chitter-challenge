require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include 'Hellooo mateee'
      expect(peeps).to include 'Alright geeza'
    end
  end
  describe '.create' do
    it 'creates a new peep' do
      Peep.create(text: 'Dash for president!')
      expect(Peep.all).to include 'Dash for president!'
    end
  end

end

