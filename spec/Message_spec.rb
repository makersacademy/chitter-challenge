require 'message'
require 'database_helpers'

describe Message do

  describe '.create' do  
    it 'creates a new peep' do
      message = Message.create(text: '\1F388')

      persisted_data = persisted_data(id: message.id, table: 'message')

      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.text).to eq '\1F388'
      expect(message.time).to include '2019'
    end
  end

  describe '.all' do
    it 'displays all peeps' do
    
      connection = PG.connect(dbname: 'chitter')

      message = Message.create(text: 'Peepin aint easy')
      Message.create(text: 'Hello')
      Message.create(text: 'This film is an idiot and so is everyone who likes it')

      peeps = Message.all

      expect(peeps.length).to eq 3
      expect(peeps.last.id).to eq message.id
      expect(peeps.last.text).to eq 'Peepin aint easy'

    end
  end
end
