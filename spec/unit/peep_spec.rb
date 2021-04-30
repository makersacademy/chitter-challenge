require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all Peeps' do
      connection = PG.connect(dbname: 'test_chitter')

      peep = Peep.create(name: "Finn", text: "Test Peep")
      Peep.create(name: "Finn", text: "I am a test peep")
      Peep.create(name: "Finn", text: "Me too")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.name).to eq "Finn"
      expect(peeps.first.text).to eq "Test Peep"
    end
  end

  describe '.create' do
    it 'creates a new Peep' do
      peep = Peep.create(name: 'Finn', text: 'dummy peep text')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.name).to eq 'Finn'
      expect(peep.text).to eq 'dummy peep text'
    end
  end

end