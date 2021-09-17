require 'chitter'
describe Chitter do

  context 'I want to post a message (peep) to chitter' do

    it 'checks the Chitter .show_all_messages returns an array of messages' do
      expect(described_class.show_all_messages).to include("message A", "message B")
    end

  end

end