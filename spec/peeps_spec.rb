require 'peeps'
require 'database_helpers'

describe Peeps do

  # subject(:peeps) { described_class.new }

  describe '.all' do
    it 'returns all peeps' do
      peep = Peeps.create(message_content: "I do not feel so good today", name: 'Wilfred')
      Peeps.create(message_content: "I love sunshine", name: 'Jenny')

      peeps = Peeps.all

      expect(peeps.length).to eq 2
      expect(peeps.id).to peep.id
      expect(peeps.first.name).to eq 'Jenny'
      expect(peeps.last.message_content).to eq('I love sunshine')
    end
  end

  describe '.create' do
    it 'creates a peep' do
      peep = Peeps.create(message_content: 'test peep', name: 'test_name')
      persisted_data = persisted_data(table: :peeps, id: peep.id )

      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'test peep'
    end
  end
end