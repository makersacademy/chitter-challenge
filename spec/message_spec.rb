require 'message'

describe Message do
  describe '.create' do
    it 'creates a new message' do
      user = User.create(first_name: 'Jay', last_name: 'Khan',date: '2018-07-08 00:00:00')
      message = Message.create(user.id, message: 'Test message',
        date: '2018-07-08 00:00:00')

      expect(Message.all).to include message
    end
  end

  describe '.all' do
      it 'returns all messages in an array' do
        user = User.create(first_name: 'Jay', last_name: 'Khan',date: '2018-07-08 00:00:00')
        # Add the test data
        message_1 = Message.create(user.id, message: 'Test message',
          date: '2018-07-08 00:00:00')
        message_2 = Message.create(user.id, message: 'Test message',
          date: '2018-07-08 00:00:00')
        message_3 = Message.create(user.id, message: 'Test message',
          date: '2018-07-08 00:00:00')
        expected_messages = [
          message_1,
          message_2,
          message_3
        ]

        expect(Message.all).to eq expected_messages
      end

      it 'returns date and time of message' do
        user = User.create(first_name: 'Jay', last_name: 'Khan',date: '2018-07-08 00:00:00')
        message_1 = Message.create(user.id, message: 'Test message',
          date: '2018-07-08 00:00:00')

        expect(message_1.date).to eq '2018-07-08 00:00:00'
      end
    end

    describe '.users' do
      it 'returns the first and last name of the user' do
        user = User.create(first_name: 'Jay', last_name: 'Khan',date: '2018-07-08 00:00:00')
        message_1 = Message.create(user.id, message: 'Test message',
          date: '2018-07-08 00:00:00')
        message_1.users.each { |user| @user = user }

        expect(@user.first_name).to eq 'Jay'
        expect(@user.last_name).to eq 'Khan'
      end
    end
end
