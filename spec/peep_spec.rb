require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      peep = Peep.create(body: 'my first peep', user_id: 1)
      Peep.create(body: 'my second peep', user_id: 1)
      Peep.create(body: 'my third peep', user_id: 1)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.body).to eq 'my first peep'
      expect(peeps.last.created_at).to eq Time.now.strftime('%R')
    end
  end

  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create(body: 'my first peep', user_id: 1)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.body).to eq 'my first peep'
      expect(peep.created_at).to eq Time.now.strftime('%R')
    end
  end
end
