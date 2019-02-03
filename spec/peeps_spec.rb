require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('To get much done in little time');")
      connection.exec("INSERT INTO peeps (peep) VALUES('I stick to the pomodoro technique');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Being methodical and sensible');")

      peeps = Peep.all
      expect(peeps).to include("Being methodical and sensible")
      expect(peeps).to include("I stick to the pomodoro technique")
      expect(peeps).to include("To get much done in little time")
    end

    it 'gets the peeps from a database' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES('To get much done in little time');")
      connection.exec("INSERT INTO peeps (peep) VALUES('I stick to the pomodoro technique');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Being methodical and sensible');")
      expect(Peep.all).to include("Being methodical and sensible")
    end
  end

  describe '.post' do
    it "inserts its argument into the database's table" do
      Peep.post(peep: "A peep posted by the user")
      expect(Peep.all).to include "A peep posted by the user"
    end
  end
end
