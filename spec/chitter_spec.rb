require 'message'

describe Message do
  describe '.all' do
    it 'shows all messages from chitter' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (text, time) VALUES ('my first comment', '2019-08-17 17:11:54+01');")
      message = Message.all
      expect(message.first.text).to include('my first comment')
      expect(message.first.time).to include('2019-08-17 17:11:54+01')
    end
  end

  describe '.create' do
    it 'allows user to post a new message to chitter' do
      connection = PG.connect(dbname: 'chitter_test')
      message = Message.create(text: 'my first comment', time: '2019-08-17 17:11:54+01')
      expect(message.text).to eq('my first comment')
    end
  end
end