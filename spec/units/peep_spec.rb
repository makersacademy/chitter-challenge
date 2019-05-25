require 'peep'

describe Peep do
  describe '.send' do
    it 'sends a new peep' do
      Peep.send(message: "Hello there")
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec "SELECT * FROM peeps;"

      expect(result.ntuples).to eq(1)
      expect(result.first['message']).to eq "Hello there"
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      Peep.send(message: "First peep")
      Peep.send(message: "Second peep")
      Peep.send(message: "Third peep")

      peeps = Peep.all

      expect(peeps).to eq([
        "Third peep",
        "Second peep",
        "First peep"
        ])
    end
  end
end
