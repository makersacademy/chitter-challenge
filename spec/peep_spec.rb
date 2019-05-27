require 'peep'
require 'pg'
require 'timecop'


describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'I went for a run')

      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'I went for a run'
    end

    it 'creates a new peep with a timestamp' do
      Timecop.freeze
      Peep.create(peep: 'I ate some cake')
      expect(Peep.all.first.time.to_s).to eq(Time.now.to_s)
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(peep: 'I walked the dog')
      Peep.create(peep: 'I went swimming')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq 'I walked the dog'
    end

  end
end