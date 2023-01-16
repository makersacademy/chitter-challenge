require_relative '../lib/post_repository'
require_relative '../lib/user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_tables
  end

  it "lists all posts with content and time stamp" do
    repo = PostRepository.new
    posts = repo.all

    expect(posts[0].id).to eq  "1"
    expect(posts[0].content).to eq "Peep 1"
    expect(posts[0].date_time).to eq "17:48:00"
  
    expect(posts[1].id).to eq  "2"
    expect(posts[1].content).to eq "Peep 2"
    expect(posts[1].date_time).to eq "18:48:00"
  end
  
  it "creates a new post" do
    repo = PostRepository.new
    user_repo = UserRepository.new
    user_repo.log_in('adam1', 'password1')
    expect(repo.create("adam1", "New Post")).to eq true
    posts = repo.all
    posts.each do |post| 
      p post.id
      p post.content
      p post.date_time
      p post.user_id
    end
    expect(posts[-1].id).to eq  "4"
    expect(posts[-1].content).to eq "New Post"
  end
  
  it "returns false when you are not logged in and try to post" do
    repo = PostRepository.new
    user_repo = UserRepository.new
    expect(repo.create("adam1", "New Post")).to eq false
  end
end