require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'Chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hello Chitter!');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Monday again :(');")

      peeps = Peep.all

      expect(peeps).to include('Hello Chitter!')
      expect(peeps).to include('Monday again :(')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'Afternoon everyone!').first

      expect(peep['peep']).to eq 'Afternoon everyone!'
    end
  end
end
