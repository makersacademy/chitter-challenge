require 'post'
require 'post_repository'
require 'database_connection'

RSpec.describe PostRepository do

  before(:each) do
    DatabaseConnection.exec(File.read('./seeds/posts_seeds.sql'))

  end 

  def entry_to_post(post_date, title, content, user_id)
    post = Post.new
    post.post_date, post.title, post.content, post.user_id = post_date, title, content, user_id
    return post
  end 

  it 'returns all posts' do
    repo = PostRepository.new
    expect(repo.all[0]).to have_attributes({post_date: '2011-11-11', title: 'test_title_1', content: 'test_content_1', user_id: 1})
    expect(repo.all[-1]).to have_attributes({post_date: '2012-10-11', title: 'test_title_4', content: 'test_content_4', user_id: 2})
  end 

  it 'returns all posts sorted' do
    repo = PostRepository.new
    expect(repo.all_sorted[0]).to have_attributes({post_date: '2011-11-11'})
    expect(repo.all_sorted[-1]).to have_attributes({post_date: '2013-10-11'})
  end

  it 'creates a new post' do
    repo = PostRepository.new
    post = entry_to_post('2011-11-11', 'title_test', 'content_test', 1)
    repo.insert_post(post)
    expect(repo.all[-1]).to have_attributes({post_date: '2011-11-11', title: 'title_test', content: 'content_test', user_id: 1, username: 'shaunho'})
  end 

  it 'creates a new post and emails those tagged in' do
    repo = PostRepository.new
    post = entry_to_post('2011-11-11', 'title_test', 'content_test @shaunho', 1)
    repo.create_post(post)
  end 





end 
