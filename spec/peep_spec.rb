require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(text: "Peep1")
      Peep.create(text: "Peep2")
      # connection.exec("INSERT INTO peeps (text) VALUES ('Peep1');")
      # connection.exec("INSERT INTO peeps (text) VALUES ('Peep2');")

      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq "Peep1"
    end
  end

  describe '#.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'Peep3')
      expect(peep.text).to eq 'Peep3'
    end
  end
end
