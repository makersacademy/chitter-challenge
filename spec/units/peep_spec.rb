require 'pg'

describe Peep do
  describe '#all' do
    it 'displays all posts' do
      Peep.add(post: 'Hello, Chitter!')

      peep_list = Peep.all

      expect(peep_list.first).to eq 'Hello, Chitter!'
    end
  end
  describe '#add' do
    it 'adds a post to the database' do
      peep = Peep.new(post: 'Hello, Chitter!')

      expect(peep.post).to eq 'Hello, Chitter!'
    end
  end
end
