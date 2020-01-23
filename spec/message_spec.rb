require 'message'

describe Message do

  let(:tag){double :tag, :new_message => nil}
  let(:user){double :user, :new_message => nil}

  before(:each) do
    user_id = DatabaseConnection.command("SELECT user_id FROM users")[0]['user_id']
    allow(user).to receive(:current_user).and_return(user_id)
    Message.setup(dbconnection: DatabaseConnection, user: user, tagclass: tag)
  end

  describe '.all' do
    it 'returns array of message instances' do
      expect(Message.all).to all( be_a(Message))
    end
    it 'messages are in reverse chronological order' do
      messages = Message.all
      expect(messages[0].time_added).to be >= messages[1].time_added
    end
    it 'comments are added to message' do
      expect(Message.all[0].comments).to all( be_a(Message))
    end
    it 'first comment is related to message' do
      message = Message.all[0]
      expect(message.comments[0]).to have_attributes(related_id: message.id)
    end
    it 'comments are in chronological order' do
      message = Message.all[0]
      expect(message.comments[0].time_added).to be <= message.comments[1].time_added
    end
  end

  describe '.add_message' do
    it 'adds a message to the message database' do
      Message.add_message(text: 'test message text')
      expect(Message.all[0].text).to eq('test message text')
    end
    it 'adds a comment to the comment database' do
      Message.add_message(text: "test comment text", related_id: Message.all[0].comments[-1].id)
      message = Message.all[0]
      expect(message.comments[-1].text).to eq("test comment text")
    end
    it 'Forwards message to tag class' do
      expect(tag).to receive(:new_message).with(instance_of(String), instance_of(String))
      Message.add_message(text: '#test_message')
    end
    it 'Forwards message to tag class' do
      expect(user).to receive(:new_message).with(instance_of(String), instance_of(String))
      Message.add_message(text: '#test_message')
    end
  end


end
