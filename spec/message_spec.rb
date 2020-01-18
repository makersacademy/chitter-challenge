describe 'Message' do
  
  describe '.create' do
    it "creates a new message" do
      Message.create(content: "Hi everyone")

      expect(Message.all).to include "Hi everyone"
    end
  end

  describe '.all' do
    it "returns all the messages posted" do
      Message.create(content: "Hi everyone")
      Message.create(content: "How is it goin")
      messages = Message.all

      expect(messages).to include "Hi everyone"
      expect(messages).to include "How is it goin"
    end
  end
end