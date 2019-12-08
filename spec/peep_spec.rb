require 'peep'

describe Peep do
  describe '.all and Peep.create' do
    it 'returns a bookmarks list' do
      peep = Peep.create('I am a test peep')
      Peep.create('I am a 2nd test peep')
      Peep.create('I am yet 3rd test peep')

      peeps = Peep.all

      expect(peeps.first.id).to eq(peep.id)
      expect(peeps.length).to eq(3)
    end
  end
end