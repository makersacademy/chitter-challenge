require 'message'

describe Message do

  describe '.all' do

    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data

      message = Message.create(msg: "hello world")
      Message.create(msg: "i love kimchi")
      Message.create(msg: "donuts, amirite?")
      
      messages = Message.all

      #this tests that the Message object returns the same data we input into the database, 
      #basically, that our object behaves the way we want it to
      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.msg).to eq 'hello world'
      # expect(message.first.ts).to eq '2019-12-07 19:29:31.493764'
    end
  end

  describe ".create" do

    it "creates a new chitter message" do
      message = Message.create(msg: "hello world")
      # persisted_data = persisted_data(id: message.id)      

      expect(message).to be_a Message
      # expect(bookmark.id).to eq persisted_data['id']
      expect(message.msg).to eq 'hello world'
      # expect(message.ts).to eq 'whatever'
    end

  end

end