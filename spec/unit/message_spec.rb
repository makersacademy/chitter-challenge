describe Message do

  context '.create' do
    it 'can create a message' do
      user = create_test_user
      message = Message.create(text: "Test message", user_id: user.id)
   
      expect(message.text).to eq "Test message"
      expect(message).to be_instance_of Message
    end
  end
  context '.all' do
    it 'can list all bookmarks' do
      user = create_test_user
      message_1 = Message.create(text: "Test message", user_id: user.id)
      message_2 = Message.create(text: "Test message 2", user_id: user.id)
      messages = Message.all

      expect(messages.size).to be 2
      expect(messages.first.text).to eq message_1.text
      expect(messages.last.text).to eq message_2.text
    end

    it 'can extract the time' do
      user = create_test_user
      message_1 = Message.create(text: "Test message", user_id: user.id)

      expect(message_1.time).to include(Time.now.to_s[11..-7])
    end

    it 'can extract the date' do
      user = create_test_user
      message_1 = Message.create(text: "Test message", user_id: user.id)

      expect(message_1.date).to include(Time.now.to_s[0..9])
    end
  end
end 
