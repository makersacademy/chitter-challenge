require 'message'

describe Message do

  describe '#all' do
    it 'returns all messages' do
      Message.create(content: "This is a test message", time: "2018-10-26 12:20:00 +0100")
      Message.create(content: "This is a second test message")

      messages = Message.all

      expect(messages.length).to eq 2
      expect(messages[0].content).to eq("This is a test message")
      expect(messages[0].time).to eq("2018-10-26 12:20:00 +0100")
      expect(messages[1].content).to eq("This is a second test message")
    end
  end

  describe '#create' do
    it 'creates a new message' do
      message = Message.create(content: "TEST CONTENT")

      expect(message.content).to eq "TEST CONTENT"
    end

    it 'adds a timestamp to message' do
      message = Message.create(content: "TEST CONTENT", time: "2018-10-26 12:20:00 +0100")

      expect(message.time).to eq "2018-10-26 12:20:00 +0100"
    end

    it 'adds user name and handle to message' do
      message = Message.create(content: "TEST", user_name: "Test Name", user_handle: "Test Username")

      expect(message.user_name).to eq "Test Name"
      expect(message.user_handle).to eq "Test Username"
    end
  end

end
