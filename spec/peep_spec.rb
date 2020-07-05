require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitter (peeps) VALUES('Hello this is a peep');")
      connection.exec("INSERT INTO chitter (peeps) VALUES('also a peep');")
      connection.exec("INSERT INTO chitter (peeps) VALUES('another peep');")

      peeps = Peep.all

      expect(peeps[0].peep).to include("Hello this is a peep")
      expect(peeps[1].peep).to include("also a peep")
      expect(peeps[2].peep).to include("another peep")
    end
  end

  describe '.send' do
    it 'sends a new peep' do
      Peep.send(peep: 'Hello I am a peep')

      expect(Peep.all[0].peep).to include 'Hello I am a peep'
    end
  end

  describe '.time' do
    it 'returns time a peep was posted' do
      peep = Peep.new(1, 'peep_1', '2018-06-10 10:27:58.348763')
      expect(peep.time).to eq('2018-06-10 10:27:58.348763')
    end
  end
end
