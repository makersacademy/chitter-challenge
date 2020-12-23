require 'chitter'


describe Chitter do
  before(:each) do
    empty
    add_base_posts
  end
  describe '#all' do
    it 'returns all posts in reverse chronological order' do
      chitter = Chitter.all

      expect(chitter).to include("tis almost Christmas!")
      expect(chitter).to include("Bring on 2021!!!")
      expect(chitter).to include("Goodbye cruel world")
    end
  end

  describe('#create') do
    it 'adds a new post' do
      Chitter.create(posts: 'Howdy Stranger!')
      # chitter = Chitter.all.last
      p Chitter
      expect(Chitter.all.first).to eq('Howdy Stranger!')
    end
  end
end
