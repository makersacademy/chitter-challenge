
describe Message do

  describe '::create' do
    it 'adds a post to the database table' do
      new_message = Message.create(user_message: "Hello").first
      expect(new_message['message']).to eq('Hello')
    end
  end

  describe '::all' do
    it 'displays all the messages in the message table' do
      Message.create(user_message: "Hello").first
      expect(Message.all[0].message).to eq("Hello")
    end
  end
end
