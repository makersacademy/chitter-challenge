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
  end


end
