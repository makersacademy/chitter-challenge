require 'post'

describe Post do
  describe '.create' do
    it 'creates a new post' do
      post = Post.create(message: "This is my first Chitter post", created_at: Time.now).first
      expect(post["message"]).to eq "This is my first Chitter post"
    end
  end
  describe '.all' do
    it 'displays a list of posts' do
      time = "2019-04-27 14:31:37"
      Post.create(message: "This is my first Chitter post", created_at: time).first
      expect(Post.all.first[:message]).to eq "This is my first Chitter post"
      expect(Post.all.first[:created_at]).to eq "27/04/19 at 14:31"
    end
  end
end
