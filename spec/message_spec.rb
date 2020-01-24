require 'message'

describe Message do

  let(:tag){double :tag, :new_message => nil}
  let(:user){double :user, :new_message => nil}

  before(:each) do
    user_id = DatabaseConnection.command("SELECT user_id FROM users")[0]['user_id']
    allow(user).to receive(:current_user).and_return(user_id)
    Message.setup(dbconnection: DatabaseConnection, user: user, tagclass: tag)
  end

  describe '.setup' do
    it 'responds to setup' do
      expect(Message).to respond_to(:setup)
    end
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
    it 'forwards message to tag class' do
      expect(tag).to receive(:new_message).with(instance_of(String), instance_of(String))
      Message.add_message(text: '#test_message')
    end
    it 'forwards message to tag class' do
      expect(user).to receive(:new_message).with(instance_of(String), instance_of(String))
      Message.add_message(text: '#test_message')
    end
  end

  describe '.messages_with_tag' do
    it 'responds to top_tags' do
      expect(Message).to respond_to(:messages_with_tag)
    end
    it 'it returns all messages with certain tag' do
      message_id_1, message_id_2, tag_id = add_2x_messages_with_tags
      messages = Message.messages_with_tag(tag_id)
      expect(messages[0].id).to eq(message_id_2)
      expect(messages[1].id).to eq(message_id_1)
    end
    it 'messages are in reverse chronological order' do
      tag_id = add_2x_messages_with_tags[2]
      messages = Message.messages_with_tag("#{tag_id}")
      expect(messages[0].time_added).to be >= messages[1].time_added
    end
    it 'returns array of message instances' do
      tag_id = add_2x_messages_with_tags[2]
      expect(Message.messages_with_tag("#{tag_id}")).to all( be_a(Message))
    end
  end


end
