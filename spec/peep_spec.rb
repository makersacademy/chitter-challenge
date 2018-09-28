
describe Peep do
  describe '.create' do
    it 'adds new messages to the peeps table' do
      Peep.create('Test Peep')
      #peeps = Peep.all
      expect(Peep.all).to include ('Test Peep')
      #expect(peep.all).to include('Test Peep')
    end
  end

  describe '.all' do
    it 'lists all the peeps of the user' do
      setup_test_database
      conn = PG.connect(dbname: 'peeps_test')
      conn.exec ("INSERT INTO peeps (messages) VALUES ('Testing messages');")
      conn.exec ("INSERT INTO peeps (messages) VALUES ('Is working');")
      conn.exec ("INSERT INTO peeps (messages) VALUES ('As expected');")
      messages = Peep.all
      expect(messages).to include("Testing messages")
      expect(messages).to include("Is working")
      expect(messages).to include("As expected")
    end
  end
end
