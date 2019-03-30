require 'message'

# RSpec::Matchers.define :appear_before do |later_content|
#   match do |earlier_content|
#     page.body.index(earlier_content) < page.body.index(later_content)
#   end
# end

describe Message do
  describe '.all' do
    it 'returns all the messages' do
      Message.post(username: 'riya', message:'Happy Easter')
      Message.post(username: 'riya', message: 'Merry Christmas')
      messages = Message.all
      expect(messages).to include('@riya: Happy Easter')
      expect(messages).to include('@riya: Merry Christmas')
    end

    it 'returns the messages in reverse chronological order' do
      Message.post(username: 'riya', message:'Happy Easter')
      Message.post(username: 'riya', message: 'Summer Vibes')
      Message.post(username: 'riya', message: 'Merry Christmas')
      messages = Message.all
      expect(messages).to eq(['@riya: Merry Christmas', '@riya: Summer Vibes', '@riya: Happy Easter'])
    end
  end

  describe '.post' do
    it 'should post a message on the feed' do
      Message.post(username: 'riya', message: "Happy Easter")
      expect(Message.all).to include "@riya: Happy Easter"
    end
  end
end
