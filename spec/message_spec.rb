require 'message'

RSpec.describe Message do
  describe '.all' do
    it 'returns all saved messages' do
      p messages = Message.all

      expect(messages).to include('This is my first peep!')
      expect(messages).to include('Second peep!')
    end
  end
end