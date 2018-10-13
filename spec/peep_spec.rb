
describe Peep do
  describe '.create' do
    it 'adds new messages to the peeps table' do
      peep = Peep.create('Test Peep')
      expect(peep).to be_a(Peep)
      expect(peep).to respond_to(:time_of_creation)
      expect(peep.messages).to eq('Test Peep')
    end
  end

  describe '.all' do
    it 'lists all the peeps of the user' do
      setup_test_database
      conn = PG.connect(dbname: 'peeps_test')
      conn.exec("INSERT INTO peeps (messages) VALUES ('Testing messages');")
      conn.exec("INSERT INTO peeps (messages) VALUES ('Is working');")
      conn.exec("INSERT INTO peeps (messages) VALUES ('As expected');")
      peep = Peep.all.first
      expect(peep).to be_a(Peep)
      expect(peep).to respond_to(:time_of_creation)
      time = Time.now.strftime("%Y-%m-%dT%H:%M:%S")
      time += '+01:00'
      expect(peep.time_of_creation.to_s).to eq time
      expect(peep.messages).to eq('Testing messages')
    end
  end
end
