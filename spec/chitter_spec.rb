require "chitter"
require "db_helpers"
describe Chitter do
  describe ".create" do
    it "creates a new post" do
      posts = Chitter.create(post: "Test post")
      persisted_data = persisted_data(id: posts.id, table: "posts")
      expect(posts).to be_a Chitter
      # expect(bookmarks.id).to eq persisted_data["id"]
      expect(posts.post).to eq "Test post"
    end
  end
end
