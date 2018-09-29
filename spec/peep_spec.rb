require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps in reverse order' do
      connection = PG.connect(dbname: 'chitter_test')

      Peep.create(peep: "My third peep")
      Peep.create(peep: "My second peep")
      Peep.create(peep: "My first peep")

      peeps = Peep.all
      peep = Peep.all.first

      expect(peeps.length).to eq 3
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep).to respond_to(:created_at)
      expect(peep.peep).to eq "My third peep"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'This is a test peep')

      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep).to respond_to(:created_at)
      expect(peep.peep).to eq 'This is a test peep'
    end
  end

end
