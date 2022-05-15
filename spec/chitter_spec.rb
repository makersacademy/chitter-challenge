require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all messages' do
      # message = Chitter.post(peep: 'I love Chitter!')
      # Chitter.post(peep: 'How do I peep?')
      # Chitter.post(peep: 'This is so fun.')

      messages = Chitter.all

      expect(messages).to include("I love Chitter!")
      expect(messages).to include("How do I peep?")
      expect(messages).to include("This is so fun.")

      # expect(messages.length).to eq 3
      # expect(messages.first).to be_a Chitter
      # expect(messages.first.id).to eq message.id
      # expect(messages.first.peep).to eq 'This is so fun.'

    end
  end
end
