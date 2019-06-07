require 'post'

describe Post do

  it 'can return all the posts' do
    posts = Post.all
    expect(posts[0].body).to eq 'First Post'
  end

  it 'can return a specific post' do
    posts = Post.all
    single_post = Post.find(posts[1].id)
    expect(single_post.body).to eq 'Second Post'
  end

end
