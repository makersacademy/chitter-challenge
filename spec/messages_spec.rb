require 'messages'

describe Messages do
  it 'responds to add' do
    expect(Messages).to respond_to(:add).with(1).argument
  end
end

describe '#add' do #Below test isolates the Message.add method
  it 'adds an entry to the database' do
    connection = PG.connect :dbname => 'chitter_test'
    Messages.add("Hello world of chitter")
    message = connection.exec("SELECT * FROM messages")
    messages = message.map{|message| "#{message['content']}"}
    expect(messages).to include "Hello world of chitter"
  end
end
