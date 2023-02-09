
require 'post_repository'

describe PostRepository do
  def reset_tables
    seed_sql = File.read('seeds/test_seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'twitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  it 'returns an array of every post' do
    repo = PostRepository.new

    posts = repo.all

    expect(posts.length).to eq 2
    expect(posts.first.title).to eq 'Title'
    expect(posts.first.contents).to eq 'Contents'
    expect(posts.first.time).to eq '2001-07-12 09:00:00'
    expect(posts.first.user_id).to eq '1'
  end

  it 'creates a new post and adds it to the posts table' do
    repo = PostRepository.new

    new_post = Post.new
    new_post.title = 'Title 3'
    new_post.contents = 'Contents 3'
    new_post.time = '2001-07-12 11:00:00'
    new_post.user_id = 1

    repo.create(new_post)

    posts = repo.all
    expect(posts.length).to eq 3
    expect(posts[2].title).to eq 'Title 3'
    expect(posts[2].contents).to eq 'Contents 3'
    expect(posts[2].time).to eq '2001-07-12 11:00:00'
    expect(posts[2].user_id).to eq '1'
  end

  it 'returns the details of a post based on id' do
    repo = PostRepository.new

    post = repo.find(1)

    expect(post.time).to eq '2001-07-12 09:00:00'
  end
end