require 'posts'

describe Posts do
  describe '.show_posts' do
    it 'Should return posts' do
      posts = Posts.show_posts
      expect(posts).to include("I will sleep")
      expect(posts).to include("I am awake")
      expect(posts).to include("I have eaten")
    end
  end


  describe '.show_posts' do
    it 'Should return posts' do
      posts = Posts.show_posts
      
    end
  end

end
