require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peeps_test')

      connection.exec("INSERT INTO peeps_library (peeps) VALUES('Good morning!');")
      connection.exec("INSERT INTO peeps_library (peeps) VALUES('Good evening!');")

      peeps = Peeps.all

      expect(peeps).to include("Good morning!")
      expect(peeps).to include("Good evening!")
    end
  end

  describe '.timestamp' do
    it 'returns the time and date the peep was created' do
      connection = PG.connect(dbname: 'peeps_test')
      connection.exec("INSERT INTO peeps_library (peeps) VALUES('Good morning!');")
      connection.exec("INSERT INTO peeps_library (peeps) VALUES('Good evening!');")
      peeps = Peeps.all
      expect(peeps).to include("Good morning!\n 2018-05-03 02:36:54.480")
      expect(peeps).to include("Good evening!\n 2018-05-03 02:36:54.480")
    end
  end

end
