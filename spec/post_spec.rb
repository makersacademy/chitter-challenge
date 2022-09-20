require './models/post'
require 'database_cleaner'

describe Post do
  before do
    DatabaseCleaner.clean_with(:truncation)
    load "./db/seeds.rb"
  end
  it 'should be able to create a post' do
    post = Post.create(body: 'content3', user_id: 1, tags: ['test1'])
    expect(post.body).to eq 'content3'
    expect(Post.all.count).to eq 3
  end
  it 'should be able to find a post' do
    post = Post.find(1)
    expect(post.body).to eq 'content1'
  end
  it 'should be able to update a post' do
    post = Post.find(1)
    post.update(body: 'content4')
    expect(post.body).to eq 'content4'
  end
  it 'should be able to delete a post' do
    post = Post.find(2).destroy
    expect(Post.all.count).to eq 1
  end
end
