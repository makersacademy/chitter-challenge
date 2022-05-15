require 'chitter'
require 'database_helpers'

describe Chitter do
  let(:time_test) { Time.new(2020, 03, 15, 10, 30, 15)}
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_messenger_test')

      message = Chitter.create(peep: "I love Chitter!", posted_at: time_test)
      Chitter.create(peep: "How do I peep?", posted_at: time_test)
      Chitter.create(peep: "This is so fun.", posted_at: time_test)

      messages = Chitter.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Chitter
      expect(messages.first.id).to eq message.id
      expect(messages.first.peep).to eq 'I love Chitter!'
      expect(messages.first.posted_at).to eq time_test.strftime('%Y-%m-%d %H:%M:%S')
    end
  end

  describe '.create' do
    it 'creates a new message' do
     message = Chitter.create(peep: 'Chitter is great!', posted_at: time_test)
     persisted_data = persisted_data(id: message.id)

     expect(message).to be_a Chitter
     expect(message.id).to eq persisted_data['id']
     expect(message.peep).to eq 'Chitter is great!'
     expect(message.posted_at).to eq time_test.strftime('%Y-%m-%d %H:%M:%S')

    end
  end

end
