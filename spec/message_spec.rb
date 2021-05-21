require 'message'

RSpec.describe Message do
  describe '.all' do
    it 'returns all saved messages' do
      con = PG.connect(dbname: 'chitter_test')
      con.exec("INSERT INTO messages (text) VALUES ('This is my first peep!');")
      con.exec("INSERT INTO messages (text) VALUES ('Second peep!');")

      messages = Message.all

      expect(messages).to include('This is my first peep!')
      expect(messages).to include('Second peep!')
    end
  end

  describe '.create' do
    it 'creates a new message' do
      Message.create('Test peep')
      messages = Message.all

      expect(messages).to include('Test peep')
    end
  end

end