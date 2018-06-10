require 'peep_message'

describe PeepMessage do
  describe '.create' do
    it 'Creates new a peep message' do
      message = "Hiiiii Maurice"
      name = "Sarah Miles"
      username = "smiles"
      post = PeepMessage.create(message, name, username, Time.now)
      expect(post.message).to eq "Hiiiii Maurice"
      expect(PeepMessage.all).to include post
    end
  end

  describe '#==' do
    it 'Two messages (peeps) are equal if their ids match' do
      message_1 = PeepMessage.new(1, 'Hiiiiii', 'Bob Bob', 'bobbobo', Time.now)
      message_2 = PeepMessage.new(1, 'Hiiiiii', 'Bob Bob', 'bobbobo', Time.now)
      expect(message_1).to eq message_2
    end
  end

  describe '.all' do
    it 'Returns all messages (peeps) in an array of newest to oldest' do
      message_1 = PeepMessage.create("Maurice, it has been too long", "Sarah Miles", "Smiles", Time.now)
      message_2 = PeepMessage.create("Sarah! I missed you", "Maurice Bendrix", "mauribendrix", Time.now)
      message_3 = PeepMessage.create("Henry is well...", "Sarah Miles", "Smiles", Time.now)
      expected_messages = [
        message_3,
        message_2,
        message_1
      ]
      expect(PeepMessage.all).to eq expected_messages
    end
  end
end
