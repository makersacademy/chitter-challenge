require "post_repository"

describe PostRepository do
  def reset_tables
    seed_sql = File.read("spec/seeds/test_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  it "lists all posts" do
    repo = PostRepository.new
    posts = repo.all

    expect(posts.length).to eq 2
    expect(posts.first.content).to eq "First post"
    expect(posts.first.time).to eq "1999-01-08 04:05:06"
    expect(posts.last.user_id).to eq 2
  end

  it "finds post by id" do
    repo = PostRepository.new
    post = repo.find(2)

    expect(post.id).to eq 2
    expect(post.content).to eq "Hi my name is Jay"
    expect(post.time).to eq "2022-06-01 19:19:19"
  end

  it "creates a new post and adds it to database" do
    repo = PostRepository.new
    post = Post.new
    post.content = "Whatever whatever"
    post.time = "2020-01-01 18:18:18"
    post.user_id = "1"

    repo.create(post)

    expect(repo.all.length).to eq 3
    expect(repo.all.last.id).to eq 3
    expect(repo.all.last.time).to eq "2020-01-01 18:18:18"
    expect(repo.all.last.user_id).to eq 1
  end
end
