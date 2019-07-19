require_relative './database_helpers'
require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do

      peep = Peep.create(text: 'This is the first peep')
      Peep.create(text: 'This is the second peep')
      Peep.create(text: 'This is the third peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0]).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'This is the first peep'
    end
  end
end
