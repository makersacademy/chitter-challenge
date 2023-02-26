require_relative '../lib/post'
require_relative '../lib/post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  it "#all will return all posts in the table" do
    repo = PostRepository.new
    posts = repo.all

    expect(posts.length).to eq 6

    expect(posts[0].id).to eq 1
    expect(posts[0].message).to eq 'Tom Riddle is a baddie'
    expect(posts[0].timestamp).to eq '2023-01-08 12:05:06'
    expect(posts[0].user_id).to eq 1
    expect(posts[0].name).to eq 'Harry Potter'
    expect(posts[0].user_name).to eq 'lightning-boy'

    expect(posts[1].id).to eq 2
    expect(posts[1].message).to eq 'gingernut has dirt on his nose'
    expect(posts[1].timestamp).to eq '2023-01-07 15:11:06'
    expect(posts[1].user_id).to eq 3
    expect(posts[1].name).to eq 'Hermione Granger'
    expect(posts[1].user_name).to eq 'clever-cloggs'
  end

  it "#find returns all posts based on user_id" do
    repo = PostRepository.new

    user_posts = repo.find_by_user_id(1)

    expect(user_posts.length).to eq 3

    expect(user_posts[0].message).to eq 'Tom Riddle is a baddie'
    expect(user_posts[1].message).to eq 'I heart Ginny'
    expect(user_posts[2].message).to eq 'Do one, Malfoy'
  end

  it "#create adds a new post into the posts table" do
    repo = PostRepository.new
  
    new_post = Post.new
    new_post.message = 'I want a Nimbus200'
    new_post.timestamp = '2023-01-08 22:10:06'
    new_post.user_id = 3
    
    repo.create(new_post)
    
    expect(repo.all.length).to eq 7
    expect(repo.all).to include(
      have_attributes(message: 'I want a Nimbus200', timestamp: '2023-01-08 22:10:06', user_id: 3)
    )
  end
end