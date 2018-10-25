require 'chitter'
require 'peep'

describe Chitter do
  describe '::all' do
    it 'shows a peep' do
      Peep.create("Hi from chitter")
      chitter = Chitter.all(Peep)
      expect(chitter.first).to eq "Hi from chitter"
    end

    it 'shows all peeps' do
      Peep.create("Hi from chitter")
      Peep.create("Hi there")
      chitter = Chitter.all(Peep)
      expect(chitter.first).to eq "Hi from chitter"
      expect(chitter.last).to eq "Hi there"
    end
  end
end
