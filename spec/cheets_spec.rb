require 'cheet'

describe Cheet do
  describe '#all' do
    it 'returns all cheets' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO cheets (cheet) VALUES('To get much done in little time');")
      connection.exec("INSERT INTO cheets (cheet) VALUES('I stick to the pomodoro technique');")
      connection.exec("INSERT INTO cheets (cheet) VALUES('Being methodical and sensible');")

      cheets = Cheet.all
      expect(cheets).to include("Being methodical and sensible")
      expect(cheets).to include("I stick to the pomodoro technique")
      expect(cheets).to include("To get much done in little time")
    end

    it 'gets the cheets from a database' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO cheets (cheet) VALUES('To get much done in little time');")
      connection.exec("INSERT INTO cheets (cheet) VALUES('I stick to the pomodoro technique');")
      connection.exec("INSERT INTO cheets (cheet) VALUES('Being methodical and sensible');")
      expect(Cheet.all).to include("Being methodical and sensible")
    end
  end
end
