require 'post'

describe Post do
  describe '.create' do
    it 'creates a new post' do
      post = Post.create("This is my first Chitter post").first
      expect(post['message']).to eq "This is my first Chitter post"
    end
  end
  describe '.all' do
    it 'displays a list of posts' do
      post = Post.create("This is my first Chitter post")
      expect(Post.all).to include("This is my first Chitter post")
    end
  end
end
