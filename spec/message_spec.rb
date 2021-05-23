require 'message'
require 'database_helpers'

RSpec.describe Message do
  describe '.all' do
    it 'returns all saved messages' do
      con = PG.connect(dbname: 'chitter_test')
      message = Message.create("This is my first peep!", "Bob")
      Message.create("Second peep!", "Bob")
      Message.create("Third peep peeps!", "Bob")

      messages = Message.all

      expect(messages.length).to eq(3)
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq(message.id)
      expect(messages.first.text).to eq('This is my first peep!')
      expect(messages.first.user_name).to eq('Bob')
    end
  end

  describe '.create' do
    it 'creates a new message' do
      message = Message.create('This is my first peep!', 'Bob')
      query_data = query_data(message.id)

      expect(message).to be_a Message
      expect(message.id).to eq query_data['id']
      expect(message.text).to eq('This is my first peep!')
      expect(message.user_name).to eq('Bob')
    end
  end

end