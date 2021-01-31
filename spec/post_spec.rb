require "post"

describe Post do 

  it "has text" do
    post = Post.new("some text")
    expect(post.text).to eq "some text"
  end



end
