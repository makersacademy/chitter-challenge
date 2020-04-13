require 'peep'

describe Peep do
  
  describe '.all' do
    it 'displays previous peeps' do
      connection = PG.connect(dbname: 'posted_peeps_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('Lorem ipsum dolor sit amet')")

      peeps = Peep.all

      expect(peeps).to include 'Lorem ipsum dolor sit amet'
    end
  end
end