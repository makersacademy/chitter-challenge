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
end