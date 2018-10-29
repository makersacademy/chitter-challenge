require 'message'
require 'database_helpers'

describe Message do
  describe '.all' do
    it ' returns a list of messages' do
      connection = PG.connect(dbname: 'chitter_test')

      #Add the test data
      message = Message.create(message: "This is my first peep", name: "Joe Bloggs")
      Message.create(message: "This is my second peep", name: "Joe Bloggs")
      Message.create(message: "This is my third peep", name: "Joe Bloggs")
      # connection.exec("INSERT INTO chitter (message) VALUES('This is my first peep');")
      # connection.exec("INSERT INTO chitter (message) VALUES('This is my second peep');")

      messages = Message.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.message).to eq "This is my first peep"
      expect(messages.first.name).to eq "Joe Bloggs"
      expect(messages.first.time).to eq(Time.new.strftime("%H:%M"))
    end
  end

  describe '.create' do
    it 'creates a new message' do
      msg = Message.create(message: 'This is a new message', name: "Joe Bloggs")
      persisted_data = persisted_data(table: "chitter", id: msg.id)
      time_now = Time.new.strftime("%H:%M")

      expect(msg).to be_a Message
      expect(msg.id).to eq persisted_data['id']
      expect(msg.message).to eq 'This is a new message'
      expect(msg.name).to eq "Joe Bloggs"
      expect(msg.time).to eq(time_now)
    end
  end
end
