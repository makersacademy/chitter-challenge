require 'message'

describe Message do
  describe '.create' do
    it 'creates a new message' do
      message = Message.create(message: 'Test message')

      expect(Message.all).to include message
    end
  end

  describe '.all' do
      it 'returns all messages in an array' do

        # Add the test data
        message_1 = Message.create(message: 'Test message 1')
        message_2 = Message.create(message: 'Test message 2')
        message_3 = Message.create(message: 'Test message 3')
        expected_Message = [
          message_1,
          message_2,
          message_3
        ]

        expect(Message.all).to eq expected_Message
      end
    end
end
