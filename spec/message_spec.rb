require 'message'

describe Message do

  describe '.all' do
    it 'shows a list of messages' do
      connection = PG.connect(dbname: 'chitter_test')
      message = Message.create(message: "The President is an idiot")
      Message.create(message: "The PM is a bellend")
      Message.create(message: "I agree!")

      messages = Message.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.message).to eq 'The President is an idiot'
    end
  end

  describe '.create' do
    it 'creates a new message' do
      message = Message.create(message: "Word.")
      expect(message).to be_a Message
      expect(message.message).to eq "Word."
    end
  end
end
