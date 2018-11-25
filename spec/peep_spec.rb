require 'peep'
require 'user'
require 'database_helper'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(message: 'First peep!', created_at: Time.now)
      Peep.create(message: 'Welcome', created_at: Time.now)

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'First peep!'
    end
  end
  describe '.create' do
    it 'creates new peep' do
      peep = Peep.create(message: 'First peep goes here', created_at: Time.now)
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'First peep goes here'
    end
  end

end
