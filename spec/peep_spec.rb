require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message, time) VALUES ('Hello', '2022-02-18 19:43:00');")
      connection.exec("INSERT INTO peeps (message, time) VALUES('Ciao ragazzi', '2022-02-17 18:33:00');")
      connection.exec("INSERT INTO peeps (message, time) VALUES ('I love coding weekends', '2022-02-17 18:32:33');")
      peeps = Peep.all
      expect(peeps).to include("Hello")
      expect(peeps).to include("Ciao ragazzi")
      expect(peeps).to include("I love coding weekends")
    end
  end
end
