require 'peep_message'

describe PeepMessage do
  describe '.create' do
    it 'creates new a peep message' do
      message = "Hiiiii Maurice"
      name = "Sarah Miles"
      username = "smiles"
      post = PeepMessage.create(message, name, username)
      expect(post.message).to eq "Hiiiii Maurice"
      # expect(post.all).to include post
    end
  end
end
