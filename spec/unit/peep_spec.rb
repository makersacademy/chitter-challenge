require './lib/peep'

describe Peep do 
  describe '.all' do
    it 'returns all peep records' do 

      connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
      connection.exec("INSERT INTO peep_record (text) VALUES ('This is a test peep');")
      connection.exec("INSERT INTO peep_record (text) VALUES('This is a second test');")
      connection.exec("INSERT INTO peep_record (text) VALUES('This is a third test');")

      peep_all = Peep.all 

      expect(peep_all).to include('This is a test peep')
      expect(peep_all).to include('This is a second test')
      expect(peep_all).to include('This is a third test')
    end 
  end 
end 