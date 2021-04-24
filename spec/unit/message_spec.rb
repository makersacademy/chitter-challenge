describe Message do
  context '.create' do
    it 'can create a message'do
      message = Message.create(text: "Test message")
   
      expect(message.text).to eq "Test message"
      expect(message).to be_instance_of Message
    end
  end
  context '.all' do
    it 'can list all bookmarks' do
      connection = PG.connect(dbname: "chitter_test")
      message_1 = Message.create(text: "Test message")
      message_2 = Message.create(text: "Test message 2")
      messages = Message.all

      expect(messages.size).to be 2
      expect(messages.first.text).to eq message_1.text
      expect(messages.last.text).to eq message_2.text
    end
  end
end 