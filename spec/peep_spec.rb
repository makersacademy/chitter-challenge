require 'Peep'

describe Peep do
  describe '.all' do
    it 'Provides a list of Peeps' do
      connection = PG.connect(dbname: "Chitter_Test")

      connection.exec("INSERT INTO peep (peep) VALUES('Hi Chitter!');")

      peeps = Peep.all

      expect(peeps).to include("Hi Chitter!")
    end
  end

  describe '.create' do
    it 'Allows you to post a new peep' do
      Peep.create(peep: "Hi Chitter!")

      expect(Peep.all).to include "Hi Chitter!"
    end
  end
end
