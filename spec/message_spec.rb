require 'message'

describe Message do

  before(:each) do
    Message.setup(dbconnection: DatabaseConnection, emailclient: EmailClient)
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
    it 'comments are related to message' do
      message = Message.all[0]
      expect(message.comments).to all( have_attributes(related_id: message.id))
    end
    it 'comments are in reverse chronological order' do
      message = Message.all[0]
      expect(message.comments[0].time_added).to be >= message.comments[1].time_added
    end
  end


end
