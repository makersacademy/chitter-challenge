require 'chitter_posts'

describe '.all' do
  it 'returns a list of posts' do
    posts = Posts.all

    expect(posts).to include "First post!"
    expect(posts).to include "Second post!"
  end
end
