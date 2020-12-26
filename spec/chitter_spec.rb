require 'chitter'


describe Chitter do
  before(:each) do
    empty
    add_base_posts
  end
  describe '#all' do
    it 'returns all posts in reverse chronological order' do
      chitter = Chitter.all

      expect(chitter).to include({:post => "tis almost Christmas!", :time => '24.12.20'})
      expect(chitter).to include({:post => "Bring on 2021!!!", :time => '24.12.20'})
      expect(chitter).to include({:post => "Goodbye cruel world", :time => '24.12.20'})
    end
  end

  describe('#create') do
    it 'adds a new post' do
      Chitter.create(post: 'Howdy Stranger!', time: '24.12.20')
      chitter = Chitter.all.first
      p chitter
      expect(chitter[:post]).to eq('Howdy Stranger!')
      expect(chitter[:time]).to eq('24.12.20')
    end
  end
end
