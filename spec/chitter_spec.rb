require 'chitter'
describe Chitter do

  context 'I want to post a message (peep) to chitter' do

    it 'checks the Chitter .show_all_messages returns an array of messages' do
      messages = described_class.show_all_messages
      expect(messages.first.message).to eq 'Lovely Stuff 3'
      expect(messages.last.message).to eq 'Lovely Stuff'
    end

  end

end