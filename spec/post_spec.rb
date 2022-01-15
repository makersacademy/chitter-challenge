require 'post'

describe Post do 
  describe '.all' do 
    it 'returns list of all posts' do 
      posts = Post.all #array of hashes?
      expect(posts).to include( {user: "kbrooks" , handle: "@kb" , content: 'test chitter post 1'} )
      expect(posts).to include( {user: "gdavies" , handle: "@gd" , content: 'test chitter post 2'} )
    end 
  end
end