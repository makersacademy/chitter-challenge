require "post_repository"

def reset_posts_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_testing' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  it 'returns all posts' do
    repo = PostRepository.new
    posts = repo.all
    
    expect(posts.length).to eq(3) # =>  3
    
    expect(posts[0].id).to eq(1) # =>  1
    expect(posts[0].message).to eq('Any man who must say, "I am the king," is no true king.') # =>  'first message'
    expect(posts[0].timestamp).to eq('2022-08-01 12:00:00') # => '2022-03-01 12:00:00'
    expect(posts[0].user_id).to eq(1) # =>  1
    
    expect(posts[1].id).to eq(2) # =>  2
    expect(posts[1].message).to eq('If you think this has a happy ending, you havent been paying attention.') # =>  'second message'
    expect(posts[1].timestamp).to eq('2022-07-04 12:00:00') # => '2022-12-04 12:00:00'
    expect(posts[1].user_id).to eq(2) # =>  2
    
    expect(posts[2].id).to eq(3) # =>  3
    expect(posts[2].message).to eq('The man who passes the sentence should swing the sword.') # =>  'The man who passes the sentence should swing the sword.'
    expect(posts[2].timestamp).to eq('2022-06-04 12:00:00')# => '2022-10-06 12:00:00'
    expect(posts[2].user_id).to eq(3) # =>  3
  end

  it 'returns a single post by id' do
    repo = PostRepository.new
    post = repo.find(1)
    
    expect(post.id).to eq(1) # =>  1
    expect(post.message).to eq('Any man who must say, "I am the king," is no true king.') # =>  'First'
    expect(post.timestamp).to eq('2022-08-01 12:00:00') # => '2022-03-01 12:00:00'
    expect(post.user_id).to eq(1) # =>  1
  end
  
  it 'adds new record to the posts table' do
    repo = PostRepository.new
    new_post = Post.new
    new_post.message = 'rain' # = 'rain'
    new_post.timestamp = '2012-12-12 10:00:00' # = '2012-12-12 10:00:00'
    new_post.user_id = 3 #= 3

    repo.create(new_post)
    posts = repo.all
    
    expect(posts.length).to eq(4) # =>  5
    expect(posts.last.message).to eq('rain') # =>  'rain'
    expect(posts.last.user_id).to eq(3) # =>  3
  end
  
  it 'updates a message' do
    repo = PostRepository.new
    repo.update_message(2, 'cloud')
    
    posts = repo.all
    expect(posts[1].id).to eq(2) # =>  2
    expect(posts[1].message).to eq('cloud') # =>  'cloud'
    expect(posts[1].timestamp).to eq('2022-07-04 12:00:00') # =>  '2022-12-04 12:00:00'
    expect(posts[1].user_id).to eq(2) # =>  2
  end

  it 'updates user_id for a post' do
    repo = PostRepository.new
    repo.update_user_id(1, 2)
    
    posts = repo.all
    expect(posts[1].id).to eq(2) # =>  2
    expect(posts[1].user_id).to eq(2) # =>  2
  end
  
  it 'deletes a post' do
    repo = PostRepository.new
    repo.delete(1)
    posts = repo.all

    expect(posts.length).to eq(2) # =>  2
    expect(posts.first.id).to eq(2) # =>  2
  end
end
