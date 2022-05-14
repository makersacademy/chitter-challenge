require 'message'

describe Message do
  describe '.all' do
    it 'displays all the messages' do
      expect(Message.all).to include "Message one, blah blah"
      expect(Message.all).to include "Message two, blah blah blah"
    end
  end
end