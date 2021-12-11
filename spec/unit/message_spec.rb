require 'message'
require 'user'

describe Message do
  describe '.create' do
    it 'creates a new message with text and time' do
      message = Message.create(text: 'Hello World!')
      expect(message.text).to eq 'Hello World!'
      expect(message.created_at).to eq Time.new.strftime("%H:%M %p %b' %d, %y").to_s
    end

    it 'stores author id in database' do
      user = User.create(username: 'Sherwin', password: 'test123')
      message = Message.create(text: 'Hello World!', user_id: user.id)
      expect(message.username).to eq user.username
    end
  end
  
  describe '.all' do
    it 'returns an array of messages' do
      Message.create(text: 'Hello World!')
      messages = Message.all
      expect(messages.first.text).to eq 'Hello World!'
    end
  end
end
