require 'message'
require 'database_helpers'

RSpec.describe Message do
  describe '.all' do
    it 'returns all saved messages' do
      con = PG.connect(dbname: 'chitter_test')
      Message.create("This is my first peep!", "Bob", "13:00 01/01/2021")
      Message.create("Second peep!", "Bob", "14:00 02/02/2021")
      message = Message.create("Third peep peeps!", "Bob", "15:00 03/03/2021")

      messages = Message.all
      expect(messages.length).to eq(3)
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq(message.id)
      expect(messages.first.text).to eq('Third peep peeps!')
      expect(messages.first.user_name).to eq('Bob')
      expect(messages.first.time_stamp).to eq('15:00 03/03/2021')
    end
  end

  describe '.create' do
    it 'creates a new message' do
      message = Message.create("This is my first peep!", "Bob", "13:00 01/01/2021")
      query_data = query_data(message.id)

      expect(message).to be_a Message
      expect(message.id).to eq query_data['id']
      expect(message.text).to eq('This is my first peep!')
      expect(message.user_name).to eq('Bob')
      expect(message.time_stamp).to eq('13:00 01/01/2021')
    end
  end

end