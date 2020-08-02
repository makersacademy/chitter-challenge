require "post"
require "pg"

describe Post do
  it "can return a list of posts" do
    connection = PG.connect(dbname: 'chitters_test')

    connection.exec("INSERT INTO chitters (chitter_text) VALUES('First chitter!');")
    connection.exec("INSERT INTO chitters (chitter_text) VALUES('Second chitter!');")
    connection.exec("INSERT INTO chitters (chitter_text) VALUES('Third chitter!');")

    posts = Post.all
    expect(posts).to include "First chitter!"
    expect(posts).to include "Second chitter!"
    expect(posts).to include "Third chitter!"
  end

  it "can save a new bookmark" do
    Post.create(peep: "Created peep!")

    expect(Post.all).to include 'Created peep!'
  end
end