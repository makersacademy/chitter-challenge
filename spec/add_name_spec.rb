require 'messages'
require 'data_base_helper'



describe Messages do
  describe '.add' do
    it 'adds message to database' do
      message_1 = Messages.add(message: 'first note add')
      persisted_data = persisted_data(id: message_1.id)

      expect(message_1).to be_a Messages
      expect(message_1.message).to eq 'first note add' 
    end
  end
  describe '.all' do
    it 'shows all messages' do
      message_1 = Messages.add(message: 'first note all')
      persisted_data = persisted_data(id: message_1.id)
      messages = Messages.all

      expect(messages.length).to eq 1
      expect(messages.first).to be_a Messages
      expect(messages.first.id).to eq message_1.id
      expect(messages.first.message).to eq'first note'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Messsages.create(message: 'Note_test')

      Messages.delete(id: message.id)

      expect(Messages.all.length).to eq 0
    end
  end
end