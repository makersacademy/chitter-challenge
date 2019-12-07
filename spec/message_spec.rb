require 'message'

describe Message do

  describe '.all' do

    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data

      message = Message.create(msg: "hello world", ts: "2019-12-07 19:29:31.493764")
      Message.create(msg: "i love kimchi", ts: "2019-12-07 19:30:55.905084")
      Message.create(msg: "donuts, amirite?", ts: "2019-12-07 19:31:22.503385")
      
      messages = Message.all

      #this tests that the Message object returns the same data we input into the database, 
      #basically, that our object behaves the way we want it to
      expect(message.length).to eq 3
      expect(message.first).to be_a Message
      expect(message.first.id).to eq message.id
      expect(message.first.msg).to eq 'hello world'
      expect(message.first.ts).to eq '2019-12-07 19:29:31.493764'
    end
  end

  # describe ".create" do

  #   it "creates a new chitter message" do
  #     bookmark = Bookmark.create(msg: "hello world")
  #     persisted_data = persisted_data(id: message.id)      

  #     expect(bookmark).to be_a Bookmark
  #     expect(bookmark.id).to eq persisted_data['id']
  #     expect(bookmark.url).to eq 'https://www.bbcgoodfood.com/'
  #     expect(bookmark.title).to eq 'BBC Good Food'
  #   end

  # end

end