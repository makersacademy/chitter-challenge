require 'peep'
require 'web_helpers'

describe Peep do
  describe '#.create' do
    it 'creates a new peep' do
      peep = Peep.create('This is the peep content!', 'user')
      expect(peep).to be_a Peep
      expect(peep.content).to eq 'This is the peep content!'
    end
  end
end