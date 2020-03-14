# frozen_string_literal: true

require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      peep = Peep.create(text: 'This is a test')
      Peep.create(text: 'This is also a test')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'This is a test'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'This is a test')
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'This is a test'
    end
  end

end
