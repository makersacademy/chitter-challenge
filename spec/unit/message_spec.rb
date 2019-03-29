require 'message'

# RSpec::Matchers.define :appear_before do |later_content|
#   match do |earlier_content|
#     page.body.index(earlier_content) < page.body.index(later_content)
#   end
# end

describe Message do
  describe '.all' do
    it 'returns all the messages' do
      Message.post(message:'Happy Easter')
      Message.post(message: 'Merry Christmas')
      messages = Message.all
      expect(messages).to include('Happy Easter')
      expect(messages).to include('Merry Christmas')
    end

    it 'returns the messages in reverse chronological order' do
      Message.post(message:'Happy Easter')
      Message.post(message: 'Summer Vibes')
      Message.post(message: 'Merry Christmas')
      messages = Message.all
      expect(messages).to eq(['Merry Christmas', 'Summer Vibes', 'Happy Easter'])
    end
  end

  describe '.post' do
    it 'should post a message on the feed' do
      Message.post(message: "Happy Easter")
      expect(Message.all).to include "Happy Easter"
    end
  end
end
