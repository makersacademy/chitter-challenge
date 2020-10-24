require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns array of all peeps' do
      Peep.create("One peep")
      Peep.create("Two peep")
      peeps = Peep.all
      first_peep = peeps.first
      
      expect(peeps).to be_a Array
      expect(peeps.length).to eq 2
      expect(first_peep.content).to eq "One peep" 
    end
  end

  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create("I created a peep!")
      expect(peep).to be_a Peep
      expect(peep.content).to eq "I created a peep!"
    end

    it 'creates a peep within the database' do
      peep = Peep.create("Hello")
      data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep.id).to eq data.first['id']
      expect(peep.content).to eq data.first['content']
      expect(peep.time).to eq data.first['time']
    end
  end

  describe '#time' do
    it 'knows what time it was created' do
      now = Time.now.strftime("%d/%m/%Y, %I:%M %p")
      peep = Peep.create("Just woke up")
      expect(peep.time).to eq now
    end
  end
end