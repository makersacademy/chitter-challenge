require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      con = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(message: "Test peep")
      Peep.create(message: "Second test peep")

      peeps = Peep.all

      expect(peeps.length).to eq 2

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Test peep').first

      expect(peep['message']).to eq 'Test peep'
    end
  end
end
