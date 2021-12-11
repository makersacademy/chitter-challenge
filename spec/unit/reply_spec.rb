require 'reply'
require 'message'
require 'user'

describe Reply do
  describe '.create' do
    it 'creates a new reply with text and time' do
      message = Message.create(text: 'Hello World!')
      reply = Reply.create(text: 'Hello Universe!', message_id: message.id)
      expect(reply.text).to eq 'Hello Universe!'
      expect(reply.created_at).to eq Time.new.strftime("%H:%M %p %b' %d, %y").to_s
    end

    it 'stores author id in database' do
      user = User.create(username: 'Sherwin', password: 'test123')
      message = Message.create(text: 'Hello World!')
      reply = Reply.create(text: 'Hello Universe!', message_id: message.id, user_id: user.id)
      expect(reply.username).to eq user.username
    end
  end
  
  describe '.all' do
    it 'returns an array of replies' do
      Reply.create(text: 'Hello World!')
      replies = Reply.all
      expect(replies.first.text).to eq 'Hello World!'
    end
  end
end
