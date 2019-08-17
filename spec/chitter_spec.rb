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
end