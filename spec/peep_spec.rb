require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'I went for a run')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'I went for a run'
    end
  end
end