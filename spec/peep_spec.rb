require 'peep'
require 'database_helpers'
require 'maker'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      maker = Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')
      peep = Peep.create(message_content: "Test peep content", maker_id: maker.id)

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message_content).to eq peep.message_content
    end
  end
  describe '.create' do
    it 'creates a new peep' do
      maker = Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')
      peep = Peep.create(message_content: "Test peep content", maker_id: maker.id)

      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message_content).to eq 'Test peep content'
      expect(peep.maker_id).to eq maker.id
    end
  end
end
