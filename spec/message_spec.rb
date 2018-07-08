require 'message'

describe Message do
  describe '.create' do
    it 'creates a new message' do
      message = Message.create(message: 'Test message', date: '2018-07-08 00:00:00')

      expect(Message.all).to include message
    end
  end

  describe '.all' do
      it 'returns all messages in an array' do

        # Add the test data
        message_1 = Message.create(message: 'Test message 1', date: '2018-07-08 00:00:00')
        message_2 = Message.create(message: 'Test message 2', date: '2018-07-08 00:00:00')
        message_3 = Message.create(message: 'Test message 3', date: '2018-07-08 00:00:00')
        expected_messages = [
          message_1,
          message_2,
          message_3
        ]

        expect(Message.all).to eq expected_messages
      end

      it 'returns date and time of message' do
        message_1 = Message.create(message: 'Test message 1', date: '2018-07-08 00:00:00')

        expect(message_1.date).to eq '2018-07-08 00:00:00'
      end
    end
end
