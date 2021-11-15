require './lib/peep'

describe Peep do

  describe '.all' do 
    it 'returns a list of all the messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('The date is November 14th');")

      Peep.create(message: "The date is November 14th", time: Time.now)


      peeps = Peep.all

      expect(peeps.count).to eq(3)

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'The date is November 14th', time: Time.now)
      Peep.create(message: 'We look forward to having you', time: Time.now)

     
      
    end
  end

end