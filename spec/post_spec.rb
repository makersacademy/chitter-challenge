require 'post'

describe Post do
  it 'adds a cheet to the database' do
    Post.create(username: 'Kane', name: 'Kane Gin', message: 'Hello there!')
    expect(Post.first.username).to eq 'Kane'
    expect(Post.first.name).to eq 'Kane Gin'
    expect(Post.first.message).to eq 'Hello there!'
  end
end
