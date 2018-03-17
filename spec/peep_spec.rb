require 'peep'

describe Peep do
  describe '.all' do
    it 'displays list of peeps' do
      peeps = Peep.all
      expect(peeps).to include('how are you people?')
      expect(peeps).to include('bored at home')
    end
  end
end
