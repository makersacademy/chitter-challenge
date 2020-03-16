require 'post'

describe Post do
  describe ".all" do
    it 'returns all posts' do
      posts = Post.all

      expect(posts).to include("peep_1")
      expect(posts).to include("peep_2")
      expect(posts).to include("peep_3")
      expect(posts).to include("peep_4")
    end
  end
end
