require 'post'
require 'post_repository'

def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end 

describe PostRepository do 
  before(:each) do 
    reset_tables
  end 

  it "returns a list of posts" do
    repo = PostRepository.new

    posts = repo.all
    expect(posts.length).to eq(9)
    expect(posts.first.content).to eq('Looking forward to a great weekend!')
  end
  
  it "returns a single post by its search criterion (id)" do 
    repo = PostRepository.new
    post = repo.find(1)

    expect(post.content).to eq('Looking forward to a great weekend!')
    expect(post.post_timestamp).to eq('2023-01-13 12:12:12')
    expect(post.user_id).to eq(1)
  end 

  it "returns all posts from a user, given a user id" do 
    repo = PostRepository.new

    posts = repo.view_user_posts(2)
    expect(posts.length).to eq(2)
    expect(posts[0].content).to eq('Hope 2023 is a good year')
  end 


  it "allows users to create posts" do 
    repo = PostRepository.new
    post = Post.new


    post.content = 'Currently testing Chitter!!'
    post.post_timestamp = '2023-01-04 07:12:24'
    post.user_id = 2

    repo.create(post)

    posts = repo.all

    expect(posts[-1].user_id).to eq('2')
    expect(posts.length).to eq(10)
    expect(posts[-1].content).to include ('Currently testing Chitter')
  end

  it "returns all posts in reverse chronological order" do 
    repo = PostRepository.new
    posts = repo.timeline
    expect(posts.length).to eq(9)
    expect(posts[-3].user_id).to eq('6')
    expect(posts[0].post_timestamp[0..3]).to eq('2022')
  end



end 