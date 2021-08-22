require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      conn = PG.connect(dbname: 'chitter_test')

      #Add the test data
      conn.exec("INSERT INTO chitter (message) VALUES('Hi, im tired!');")
      conn.exec("INSERT INTO chitter (message) VALUES('Hi, life has bein good!');")
      
      peeps = Peeps.all

      expect(peeps).to include("Hi, im tired!")
      expect(peeps).to include("Hi, life has bein good!")
    end
  end
  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(message: 'I stay happy')
  
      expect(Peeps.all).to include 'I stay happy'
    end
  end
end