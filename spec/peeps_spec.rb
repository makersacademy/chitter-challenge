require 'peep'
require 'database_helper'
require_relative '../spec/features/web_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      PG.connect(dbname: 'chitter_test')

      Peep.create(message: 'Wow it was hot yesterday...', user_id: 1)
      Peep.create(message: 'Busy doing some coding today', user_id: 1)
      Peep.create(message: 'Heading to the pub later!', user_id: 1)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'Heading to the pub later!'

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Great win for Liverpool this week', user_id: 1)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'Great win for Liverpool this week'

    end
  end
end
