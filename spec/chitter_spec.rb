require 'chitter'
require 'database_helpers'

describe Chitter do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_messenger_test')

      message = Chitter.create(peep: "I love Chitter!")
      Chitter.create(peep: "How do I peep?")
      Chitter.create(peep: "This is so fun.")

      messages = Chitter.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Chitter
      expect(messages.first.id).to eq message.id
      expect(messages.first.peep).to eq 'I love Chitter!'
    end
  end

  describe '.create' do
    it 'creates a new message' do
     message = Chitter.create(peep: 'Chitter is great!')
     persisted_data = persisted_data(id: message.id)

     expect(message).to be_a Chitter
     expect(message.id).to eq persisted_data['id']
     expect(message.peep).to eq 'Chitter is great!'
    end
  end

end
