require_relative '../lib/chitter'
require 'database_helpers'

describe Chitter do
  describe '#post' do
    it 'saves and returns the posted peep' do
      peep = Chitter.post("Hello, chitter!")
      expect(peep.content).to eq ("Hello, chitter!")
    end
  end

  describe '#list' do
    it 'lists all the posted peeps' do
      
      peep = Chitter.post("Test peep")
      
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Chitter
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'Test peep'
    end
  end
end