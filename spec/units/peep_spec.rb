require_relative './database_helpers'
require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps in reverse order, with a timestamp' do
      Timecop.freeze(Time.now)
      
      peep = Peep.create(text: 'This is the first peep')
      Peep.create(text: 'This is the second peep')
      Peep.create(text: 'This is the third peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0]).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.text).to eq 'This is the first peep'
      expect(peeps.last.timestamp). to eq Time.now
    end
  end
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'This is a creation-testing peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'This is a creation-testing peep'
    end
  end
end
