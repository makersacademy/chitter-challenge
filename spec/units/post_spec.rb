require "post"
describe Post do
  it "When we create a post by its text, it will be inserted to our database" do
    post = Post.create("This is the text of the post")
    persisted_data = PG.connect(dbname: 'chitter_test')
    result = persisted_data.exec("SELECT * FROM Post;")
    expect(result[0]["text"]).to eq "This is the text of the post"
  end
end
