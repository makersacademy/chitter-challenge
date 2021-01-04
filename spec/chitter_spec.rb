require "chitter"
require "db_helpers"
describe Chitter do
  describe ".all" do
    it "returns a list of posts" do
      # Add the test data
      posts = Chitter.all
      expect(posts.length).to eq 1
      expect(posts.first).to be_a Chitter
      expect(posts.first.id).to eq "1"
      expect(posts.first.post).to eq "Lorem Ipsum"
      expect(posts.first.username).to eq "admin"
    end
  end
  describe ".create" do
    it "creates a new post" do
      post = Chitter.create(post: "New post", date: "Saturday, 02/Jan/21 at 04:28 PM", username: "admin")
      pd = pd(id: post.id, table: "posts")

      expect(post).to be_a Chitter
      expect(post.id).to eq pd.first["id"]
      expect(post.post).to eq "New post"
      expect(post.username).to eq "admin"
    end
  end
end
