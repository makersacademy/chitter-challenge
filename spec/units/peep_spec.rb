require 'pg'

describe Peep do
  describe '#all' do
    it 'displays all posts' do

      Peep.add(post: 'Hello, Chitter!', time: '04/04/2019 14:44', name: 'Hannah')

      peep_list = Peep.all

      expect(peep_list.first.post).to eq 'Hello, Chitter!'
    end
  end
  describe '#add' do
    it 'adds a post to the database' do
      peep = Peep.new(post: 'Hello, Chitter!', time: '04/04/2019 14:44', name: 'Hannah')

      expect(peep.post).to eq 'Hello, Chitter!'
    end
  end
end
