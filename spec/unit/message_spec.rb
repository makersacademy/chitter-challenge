require 'message'

describe Message do
  describe '.create' do
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec("INSERT INTO messages VALUES")
    Message.create(text: 'Hello World!')
    messages = Message.all
    expect(messages.first.text).to eq 'Hello World!'
  end
  describe '.all' do
    it 'returns an array of messages' do
      messages = Message.all
      
      expect(messages.first.text).to eq 'Hello World!'
    end
  end
end