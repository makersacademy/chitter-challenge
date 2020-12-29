require "chitter"
require "db_helpers"
describe Chitter do
  describe ".create" do
    it "creates a new post" do
      posts = Chitter.create(post: "Test post", date: Time.new.strftime("%A, %d/%b/%y at %I:%M %p"))
      persisted_data = persisted_data(id: posts.id, table: "posts")
      expect(posts).to be_a Chitter
      # expect(bookmarks.id).to eq persisted_data["id"]
      expect(posts.post).to eq "Test post"
      expect(posts.date).to eq Time.new.strftime("%A, %d/%b/%y at %I:%M %p")
    end
  end
end
