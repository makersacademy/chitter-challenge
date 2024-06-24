require 'post'
require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  it 'returns a list of all post' do
    repo = PostRepository.new
    all_posts = repo.all
  
    expect(all_posts.length).to eq(2)
    expect(all_posts.last.message).to eq('No good sittin’ worryin’ abou’ it. What’s comin’ will come, an’ we’ll meet it when it does.')
    expect(all_posts.last.time_created).not_to be_empty
  end

  it 'finds one post -id: 1-' do
    repo = PostRepository.new
    post = repo.find(1)

    expect(post.message).to eq ('If you want to know what a man’s like, take a good look at how he treats his inferiors, not his equals.')
    expect(post.time_created).not_to be_empty
  end

  it 'finds another post -id: 2-' do
    repo = PostRepository.new
    post = repo.find(2)

    expect(post.message).to eq ('No good sittin’ worryin’ abou’ it. What’s comin’ will come, an’ we’ll meet it when it does.')
    expect(post.time_created).not_to be_empty
  end

  it 'creates a new post -Example-' do
    new_post = Post.new
    new_post.message = 'Message 3'
    new_post.time_created = '2023-01-15 18:46:55.91997'

    repo = PostRepository.new
    repo.create(new_post)

    all_posts = repo.all

    expect(all_posts.length).to eq(3)
    expect(all_posts.last.message).to eq('Message 3')
    expect(all_posts.last.time_created).not_to be_empty
  end

  # it 'deletes a post' do
  #   repo = PostRepository.new
  #   repo.delete(1)
  #   all_posts = repo.all

  #   expect(all_posts.length).to eq(1)
  #   expect(all_posts.last.message).to eq('No good sittin’ worryin’ abou’ it. What’s comin’ will come, an’ we’ll meet it when it does.')
  # end
end
