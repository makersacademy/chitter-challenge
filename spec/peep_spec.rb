require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('Today is the day!');")

      bookmarks = Peep.all

      expect(bookmarks).to include('Today is the day!')
    end
  end

  describe '#create' do
    it 'creates a new peep' do
      Peep.create(message: 'Today is the day!')
      Peep.create(message: 'Enjoy your weekend!')
  
      expect(Peep.all).to include 'Today is the day!'
      expect(Peep.all).to include 'Enjoy your weekend!'
    end
  end
end