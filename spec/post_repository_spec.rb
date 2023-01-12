require_relative '../lib/post_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  after(:each) do 
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
    repo.create("adam1", "New Post")
    posts = repo.all
    time = Time.now
    expect(posts[-1].id).to eq  "4"
    expect(posts[-1].content).to eq "New Post"
    #expect(posts[-1].date_time).to eq time
  end

  it "creates a new post with different details" do
    repo = PostRepository.new
    repo.create("joe1", "New Post2")
    posts = repo.all
    time = Time.now
    expect(posts[-1].id).to eq  "4"
    expect(posts[-1].content).to eq "New Post2"
    #expect(posts[-1].date_time).to eq time
  end
end