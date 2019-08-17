require 'message'

describe Message do
  describe '.all' do
    it 'shows all messages from chitter' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (text) VALUES ('my first comment');")
      connection.exec("INSERT INTO peeps (text) VALUES ('my second comment');")
      message = Message.all
      expect(message).to include('my first comment')
      expect(message).to include('my second comment')
    end
  end

  describe '.create' do
    it 'allows user to post a new message to chitter' do
      connection = PG.connect(dbname: 'chitter_test')
      message = Message.create(text: 'my first comment')
      expect(message.text).to eq('my first comment')
    end
  end
end