require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'Chitter_feed_test')

      #connection.exec("INSERT INTO peeps (message) VALUES ('peeps');")
      #connection.exec("INSERT INTO peeps (message) VALUES('hello world');")
      Peep.create(message: 'peeps')
      Peep.create(message: 'hello world')

      peeps = Peep.all

      expect(peeps).to include("peeps")
      expect(peeps).to include("hello world")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'hey dude')
  
      expect(Peep.all).to include 'hey dude'
    end
  end
end