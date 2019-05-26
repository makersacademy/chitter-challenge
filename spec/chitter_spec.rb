require 'peep'

describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(peep: "Hey guys!")

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.peep).to eq("Hey guys!")
      expect(peeps.first.id).to eq peep.id
    end
  end

  describe '.create' do
    it 'posts a new peep' do
      peep = Peep.create(peep: "Anybody for a movie?")
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.query("SELECT * FROM peeps WHERE id = '#{peep.id}';")

      expect(peep).to be_a Peep
      expect(peep.id).to eq result.first['id']
      expect(peep.peep).to eq("Anybody for a movie?")
    end
  end
end