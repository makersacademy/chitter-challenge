require 'message'

describe Message do

  describe '.create' do  
    it 'creates a new peep' do
     message = Message.create(text: 'A peep').first
      
      expect(message['text']).to eq 'A peep'
      expect(message['time']).to include '2019'
    end
  end

  describe '.all' do
    it 'displays all peeps' do

      connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM message')
    result.map { |peep| peep['text'] }
    end
  end
end
