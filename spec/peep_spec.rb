# frozen_string_literal: true

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(message: 'Hello beautiful world :o)')

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq(peep.id)
      expect(peeps.first.message).to eq('Hello beautiful world :o)')
      expect(peeps.first.created_at).to match(/\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}/)
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      peep = Peep.create(message: 'Hello beautiful world :o)')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Hello beautiful world :o)'
      expect(peep.created_at).to match(/\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}/)
    end
  end
end
