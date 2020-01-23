require 'message'

describe Message do

  let(:email_client){double :email_client, :send_email => nil}
  let(:tag){double :tag, :add_tag => nil}

  before(:each) do
    Message.setup(dbconnection: DatabaseConnection, emailclient: email_client, tagclass: tag)
    @user_id = DatabaseConnection.command("SELECT user_id FROM users")[0]['user_id']
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
      Message.add_message(message: 'test message text', user_id: @user_id)
      expect(Message.all[0].text).to eq('test message text')
    end
    it 'adds a comment to the comment database' do
      Message.add_message(message: "test comment text", user_id: @user_id, related_id: Message.all[0].comments[-1].id)
      message = Message.all[0]
      expect(message.comments[-1].text).to eq("test comment text")
    end
    it 'Forwards any tags included in message/comment to tag class' do
      expect(tag).to receive(:add_tag).with(["rspeciscool", "testtag2"])
      Message.add_message(message: 'test message text #rspeciscool #testtag2', user_id: @user_id)
    end
    it 'Sends user a personalised email if mentioned by handle' do

    end
  end


end
