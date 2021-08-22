require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      conn = PG.connect(dbname: 'chitter_test')

      #Add the test data
      conn.exec("INSERT INTO chitter (message) VALUES('Hi, im tired!');")
      conn.exec("INSERT INTO chitter (message) VALUES('Hi, life has bein good!');")
      
      peeps = Peeps.all

      expect(peeps).to has_content("Hi, im tired!")
      expect(peeps).to has_content("Hi, life has bein good!")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(message: 'I stay happy')
  
      expect(Peeps.all).to has_content 'I stay happy'
    end
  end
end