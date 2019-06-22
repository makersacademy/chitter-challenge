require 'Peep'

describe Peep do
  describe '.all' do
    it 'Provides a list of Peeps' do
      connection = PG.connect(dbname: "Chitter_Test")

      connection.exec("INSERT INTO peep (peep) VALUES('Hi Chitter!');")

      peeps = Peep.all

      expect(peeps).to include("Hi Chitter!")
    end

    it 'Lists the Peeps in reverse chronological order' do
      connection = PG.connect(dbname: "Chitter_Test")

      connection.exec("INSERT INTO peep (peep) VALUES('Hi Chitter!');")
      connection.exec("INSERT INTO peep (peep) VALUES('I love Chitter');")

      peeps = connection.exec("SELECT * FROM peep ORDER BY timestamp DESC;")
      timestamps = peeps.map { |peep| peep['timestamp'] }

      expect(timestamps[0] > timestamps[1]).to be true
    end
  end

  describe '.create' do
    it 'Allows you to post a new peep' do
      Peep.create(peep: "Hi Chitter!")

      expect(Peep.all).to include "Hi Chitter!"
    end
  end
end
