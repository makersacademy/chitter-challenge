require 'peep'

describe Peep do

  describe '#all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message, time) VALUES('Hello', '2022-02-18 19:43:00');")
      connection.exec("INSERT INTO peeps (message, time) VALUES('Ciao ragazzi', '2022-02-17 18:33:00');")
      connection.exec("INSERT INTO peeps (message, time) VALUES('I love coding weekends', '2022-02-17 18:32:33');")
      peeps = Peep.all
      expect(peeps).to include("Hello")
      expect(peeps).to include("Ciao ragazzi")
      expect(peeps).to include("I love coding weekends")
    end

    it 'sorts peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message, time) VALUES('Very old peep', '2022-02-15 08:43:00');")
      connection.exec("INSERT INTO peeps (message, time) VALUES('Newest peep', '2022-02-17 18:33:00');")
      connection.exec("INSERT INTO peeps (message, time) VALUES('This peep is between old and new', '2022-02-17 18:32:33');")
      peeps = Peep.all
      expect(peeps.first).to eq "Newest peep"
      expect(peeps.last).to eq "Very old peep"
    end
  end

  describe '#write' do
    it 'creates a new peep' do
      Peep.write(text: 'This is a newly created peep')
      expect(Peep.all).to include 'This is a newly created peep'
    end
  end
end
