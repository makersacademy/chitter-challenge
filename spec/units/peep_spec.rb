require 'peep'

describe Peep do
  describe '#.create' do
    it 'adds new peep to peeps db' do
      post = Peep.new(message: 'just setting up my twttr')
      expect(post.message).to eq 'just setting up my twttr'
    end
  end
end
