require './lib/message'

describe Message do

  describe ".all" do
    it "should returns a list of messages" do
      connection = PG.connect(dbname: 'messages_manager_test')
      Message.create(name: "Test name 1", content: "Testing content numero uno")
      Message.create(name: "Test name 2", content: "Testing content numero dos")

      messages = Message.all
      message = messages.first

      expect(messages.length).to eq 2
      expect(message).to be_a Message
      expect(message).to respond_to(:id)
      expect(message.name).to eq 'Test name 1'
      expect(message.content).to eq 'Testing content numero uno'
    end
  end

  describe '.create' do
    it 'creates a new message' do
      message = Message.create(name: 'Test name', content: 'Testing content')

      expect(message).to be_a Message
      expect(message).to respond_to(:id)
      expect(message.name).to eq 'Test name'
    end
  end
end
