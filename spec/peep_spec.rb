require 'pg'
require 'database_helpers'
require 'spec_helper'

describe Peep do

  describe '.all' do
    it 'returns a list of the peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(content: "This is my first peep")
      Peep.create(content: "This is my second peep")
      Peep.create(content: "This is my third peep")
      
      peeps = Peep.all

      expect(peeps.length).to eq(3)
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq("This is my first peep")
      expect(peeps.last.content).to eq("This is my third peep")
    end
  end

  describe '.create' do
    it 'makes a new peep' do
      peep = Peep.create(content: "I have made a tweet")
      persisted_data = persisted_data(id: peep.id)
      
      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data['id'])
      expect(peep.content).to eq("I have made a tweet")
    end
  end

  describe '.timing' do
    it 'reports the time the peep was made' do
      peep = Peep.create(content: "I have made a tweet")
      expect(peep.timing).to match(/\d{2}:\d{2}:\d{2}/)
    end
  end
  
end