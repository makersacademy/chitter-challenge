require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'should return a list of Peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      peep = Peep.add(name: "Gray", peep: "Lovin the databases...")
      Peep.add(name: "Ocean", peep: "Oh my days...")
      Peep.add(name: "August", peep: "What a week")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      # expect(peeps.first).to be_a Peep
      # expect(peeps.first.id).to eq peep.id
      # expect(peep.first.name).to eq 'Gray'
      # expect(peep.first.peep).to eq 'Lovin the databases...'
    end
  end

  describe '.add' do
    it 'should create a new Peep' do
      peep = Peep.add(name: 'Gray', peep: 'Lovin the databases...')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.name).to eq 'Gray'
      expect(peep.peep).to eq 'Lovin the databases...'
    end
  end
end
