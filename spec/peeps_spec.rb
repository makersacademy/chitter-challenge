require 'peeps'

describe Peeps do

  describe '#create' do
    it 'creates a new peep' do
      Peeps.create(peep: 'hello, world')
      expect(Peeps.all).to include 'hello, world'
    end
  end

  describe '#all' do
    it 'shows all peeps in reverse chronological order' do
      Peeps.create(peep: 'hello, world')
      Peeps.create(peep: 'how are you today?')
      expect(Peeps.all).to eq(["how are you today?", "hello, world"])
    end
  end

end
