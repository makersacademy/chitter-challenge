require './models/post'

describe Post do

  describe '#all' do
      it "contains more than 1 post" do
        post_1 = Post.create(content: 'jimmy jam')
        post_2 = Post.create(content: 'jimmy joe')
        posts = Post.all
        expect(posts.length).to eq 2
        expect(posts.first).to be_a Post
        expect(posts.first.content).to eq('jimmy jam')
      end
    end

  describe '#create' do
      it "creates a new post" do
        post = Post.create(content: 'jimmy jam')
        expect(post).to be_a Post
        expect(post.content).to eq('jimmy jam')
      end
    end

  describe '#order' do
    it "orders post by creation date and time" do
      post_1 = Post.create(content: 'jimmy jam')
      post_2 = Post.create(content: 'jimmy joe')
      posts = Post.all.order(created_at: :desc)
      expect(posts.first.content).to eq post_2.content
    end
  end
end
