require "post"
describe Post do
  describe "#create" do
    it "When we create a post by its text, it will be inserted to our database" do
      post = Post.create("This is the text of the post")
      persisted_data = PG.connect(dbname: 'chitter_test')
      result = persisted_data.exec("SELECT * FROM Post;")
      expect(result[0]["text"]).to eq "This is the text of the post"
    end
  end

  describe "#all" do
    it "Returns an array of all posts which is sorted based on dates" do
      first_post = Post.create( "the first post")
      second_post = Post.create("the second post")
      expect(Post.all[0].text).to eq "the first post"
      expect(Post.all[1].text).to eq "the second post"
    end
  end
end
