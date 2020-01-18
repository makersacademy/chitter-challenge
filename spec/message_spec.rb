describe 'Message' do
  
  describe '.create' do
    it "creates a new message" do
      message = Message.create(content: "Hi everyone", time: '2017-07-23 00:00:00').first
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM messages WHERE id = #{message.id};")

      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.content).to eq "Hi everyone"
      expect(message.time).to eq '2017-07-23 00:00:00'
    end
  end

  describe '.all' do
    it "returns all the messages posted" do
      Message.create(content: "Hi everyone", time: '2020-01-18 17:00:00')
      Message.create(content: "How is it goin", time: '2020-01-18 17:01:00')
      messages = Message.all

      expect(messages[1].content).to eq "Hi everyone"
      expect(messages.first.content).to eq "How is it goin"
      expect(messages.first).to be_a Message
      expect(messages.first.time).to eq '2020-01-18 17:01:00'
    end
  end
end