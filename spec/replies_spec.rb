require 'replies'

describe Replies do
  describe '.create' do
    it 'creates a reply to a peep' do
      reply = Replies.create(peep_id: peep.id, message: 'Test', user_id: 1)

      expect(reply.message).to eq 'Test'
    end
  end

    it 'attaches to a peep' do
      peep = Peeps.create(message: 'Test', user_id: 1)
      reply = Replies.create(peep_id: peep.id, message: 'Test', user_id: 1)

      expect(peep.replies).to eq 'Test'
    end
end
