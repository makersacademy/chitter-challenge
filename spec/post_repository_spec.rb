require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_directory_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_posts_table
  end

  it 'returns all posts' do
    repo = PostRepository.new
    posts = repo.all

    expect(posts.length).to eq 4

    expect(posts[0].id).to eq 1
    expect(posts[0].message).to eq 'message 1'
    expect(posts[0].timestamp).to eq '2022-07-15 10:23:54'
    expect(posts[0].user_id).to eq 1

    expect(posts[1].id).to eq 2
    expect(posts[1].message).to eq 'message 2'
    expect(posts[1].timestamp).to eq '2022-07-15 10:24:54'
    expect(posts[1].user_id).to eq 2

    expect(posts[2].id).to eq 3
    expect(posts[2].message).to eq 'message 3'
    expect(posts[2].timestamp).to eq '2022-07-16 10:25:54'
    expect(posts[2].user_id).to eq 3

    expect(posts[3].id).to eq 4
    expect(posts[3].message).to eq 'message 4'
    expect(posts[3].timestamp).to eq '2022-07-16 10:26:54'
    expect(posts[3].user_id).to eq 2
  end

  it 'returns a single post' do
    repo = PostRepository.new
    post = repo.find(1)
    
    expect(post[0].id).to eq 1
    expect(post[0].message).to eq 'message 1'
    expect(post[0].timestamp).to eq '2022-07-15 10:23:54'
    expect(post[0].user_id).to eq 1
  end

  it 'adds new post' do
    repo = PostRepository.new

    post = Post.new
    post.message = 'fun message'
    post.timestamp = '2022-07-17 10:26:54'
    post.user_id = 3
    repo.create(post)

    posts = repo.all
    expect(posts.length).to eq 5
    expect(posts.last.message).to eq 'fun message'
    expect(posts.last.user_id).to eq 3
  end
  
  it 'updates a message' do
    repo = PostRepository.new
    repo.update(2, 'message', 'funnier message')
    
    posts = repo.all
    expect(posts[1].id).to eq 2
    expect(posts[1].message).to eq 'funnier message'
    expect(posts[1].timestamp).to eq '2022-07-15 10:24:54'
    expect(posts[1].user_id).to eq 2
  end

  it 'delets a post' do
    repo = PostRepository.new
    
    repo.delete(1)
    posts = repo.all
    
    expect(posts.length).to eq 3
    expect(posts.first.id).to eq 2
  end
end
