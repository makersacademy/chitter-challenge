require './lib/peep'

describe Peep do

  describe '.all' do 
    it 'returns a list of all the messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('The date is November 14th');")


      peeps = Peep.all

      expect(peeps).to include('The date is November 14th')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'The date is November 14th')
      Peep.create(message: 'We look forward to having you')

      expect(Peep.all).to include 'The date is November 14th'
      expect(Peep.all).to include 'We look forward to having you'
    end
  end

end