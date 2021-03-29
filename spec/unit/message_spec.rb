require 'message'

describe Message do
  describe '.get_messages' do
    it "retrieves all messages created by users, returned as an array of Messages" do
      message = Message.get_messages[0]
      expect(message).to be_kind_of(Message)
      expect(message).respond_to?(:name)
      expect(message).respond_to?(:username)
      expect(message).respond_to?(:time)
      expect(message).respond_to?(:text)
    end
    it "orders each message by time, newest first" do
      # 'Windows > Mac', '2021-01-05 08:12:01' is the newest
      message = Message.get_messages[0]
      expect(message.name).to eq("Taran")
      expect(message.text).to eq("Windows > Mac")
    end
  end
  describe '.create_peep' do
    it 'inserts a new message into the database and returns a Message' do
      allow(Message).to receive(:get_time).and_return("2021-03-28 18:44:35")
      message = Message.create_peep("taran314", "Chitter is the best") 
      expect(message).to be_kind_of(Message)
      expect(message.name).to eq("Taran")
      expect(message.username).to eq("taran314")
      expect(message.time).to eq("2021-03-28 18:44:35")
      expect(message.text).to eq("Chitter is the best")
    end
  end
end
