require 'database_helpers'
require './lib/peep'

describe Peep do

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(fullname: 'Jack Jones', username: 'JJones',content: 'Test peep')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)
      Peep.create(fullname: 'Bill Billson', username: 'BBson',content: 'Hello')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'Test peep'
      expect(peep.username).to eq 'JJones'
    end
  end

end
