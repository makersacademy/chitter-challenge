require './lib/chitter'
require 'database_helpers'

describe Chitter do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_challenge_test')
      connection.exec("INSERT INTO messages (nickname, message) VALUES('Bob', 'Makers Academy Welcome Post');")
      connection.exec("INSERT INTO messages (nickname, message) VALUES('Bob', 'Destroy All Software the Terminator is coming');")
      connection.exec("INSERT INTO messages (nickname, message) VALUES('Dave', 'Google is the best search engine in the world');")
      messages = Chitter.open
      expect(messages[0]['message']).to include 'Makers Academy Welcome Post'
      expect(messages[1]['message']).to include 'Destroy All Software the Terminator is coming'
      expect(messages[2]['message']).to include 'Google is the best search engine in the world'

    end
  end
  describe '.create' do
    it 'creates new peep' do
      nickname = 'Bob'
      message = 'Tests are the best'
      post_time = Time.now.strftime("%d/%m/%Y %H:%M")
      new_message = Chitter.create(nickname, message, post_time)
      persisted_data = persisted_data(id: new_message.id, table: 'messages')
      expect(new_message).to be_a Chitter
      expect(new_message.id).to eq persisted_data.first['id']
      expect(new_message.nickname).to eq nickname
      expect(new_message.message).to eq message
      expect(new_message.post_time).to eq post_time
    end
  end
end
