require_relative '../lib/peep.rb'
require 'database_helpers'

describe Peep do
  describe '#post' do
    it 'saves and returns the posted peep' do
      peep = Peep.post("Hello, Chitter!")
      expect(peep.content).to eq ("Hello, Chitter!")
      expect(peep.post_time).to eq Time.now.strftime("%H:%M:%S")
    end
  end

  describe '#list' do
    it 'lists all the posted peeps' do
      
      peep = Peep.post("Test peep")
      
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'Test peep'
    end
  end
end