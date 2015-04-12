require 'spec_helper'

feature 'User adds a new post' do
  scenario 'when on homepage' do
    expect(Post.count).to eq (0)
    visit '/'
    add_post('Caron', 'Hello! out there')
    expect(Post.count).to eq(1)
    post = Post.first
    expect(post.username).to eq('Caron')
    expect(post.message).to eq('Hello! out there') 
  end

  scenario 'add hashtags to posts' do
    visit '/'
    add_post('Stace', 
            'Hello! out there',
             %w('#testing #123'))
    post = Post.first
     expect(post.hashtag.map(&:text)).to include('#testing')
     expect(post.hashtag.map(&:text)).to include('#123')
  end
end