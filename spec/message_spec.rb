require './lib/message.rb'

describe Message do

  describe 'self.create' do
    it 'adds a post to the database table' do
      message = Message.create(user_message: "Hello").first
      expect(message['message']).to eq('Hello')
    end
  end

  describe 'self.all' do
    it 'displays all the messages' do
      Message.create(user_message: "Hello").first
      expect(Message.all[0].message).to eq("Hello")
    end
  end
end