require_relative '../lib/post_repository'
require_relative '../lib/post'

def reset_chitter_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_chitter_table
  end

  it 'returns list of posts' do
    repo = PostRepository.new
    posts = repo.all
    expect(posts.length).to eq(5)
    expect(posts.first.content).to eq('I love music! x')
    expect(posts[1].date).to eq('2022-10-31')
    expect(posts[2].time).to eq('10:20:00')
    expect(posts.last.user_id).to eq(2)
  end

  it 'finds post with ID 3' do
    repo = PostRepository.new
    post = repo.find(3)
    expect(post.author_name).to eq('Hook')
    expect(post.author_handle).to eq('@captain_hook')
    expect(post.content).to eq('arrrr hide me from batman x')
    expect(post.date).to eq('2022-10-31')
    expect(post.time).to eq('10:20:00')
    expect(post.user_id).to eq(3)
  end

  it 'creates a new post' do
    repo = PostRepository.new
    post = Post.new
    post.content = 'going to jump ship ttyl x'
    post.date = '2022-11-01'
    post.time = '13:35:00'
    post.user_id = 3
    repo.create(post)
    posts = repo.all
    expect(posts.last.content).to eq('going to jump ship ttyl x')
    expect(posts.last.date).to eq('2022-11-01')
    expect(posts.last.time).to eq('13:35:00')
    expect(posts.last.user_id).to eq(3)
  end

end