require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds.sql')
  if ENV["PG_password"] 
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', password: ENV["PG_password"] })
  else
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  end
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  # (your tests will go here).

  # 1
# Get all posts
  it "Get all posts" do
    repo = PostRepository.new

    posts = repo.all

    expect(posts.length).to eq 3

    expect(posts[0].id).to eq '1'
    expect(posts[0].title).to eq 'post01'
    expect(posts[0].content).to eq 'content01'
    expect(posts[0].create_at).to eq '2017-05-25 17:39:49+08'

    expect(posts[1].id).to eq '2'
    expect(posts[1].title).to eq 'post02'
    expect(posts[1].content).to eq 'content02'
    expect(posts[1].create_at).to eq '2018-05-25 17:39:49+08'
  end
    # 2
    # create a single post
    it "create a single post" do
    repo = PostRepository.new

    post = Post.new
    post.title = 'post04'
    post.content = 'content04'
    post.create_at = '2019-05-25 17:39:49+08'

    repo.create(post)

    posts = repo.all

    last_post = posts.last
    expect(last_post.title).to eq 'post04'
    expect(last_post.content).to eq 'content04'
  end

    # 3
    # Get an error if title null
  it "Get an error if title null" do
    repo = PostRepository.new

    post = Post.new
    post.title = nil
    post.content = '123'
    post.create_at = '2018-05-25 17:39:49+08'

    expect{repo.create(post)}.to raise_error PG::NotNullViolation
  end

  #4 Find the user_id 2's post
  it " Find the user_id 2's post" do

    repo = PostRepository.new

    posts = repo.find(2)

      expect(posts.length).to eq 2

      expect(posts[0].id).to eq '2'
      expect(posts[0].title).to eq 'post02'
      expect(posts[0].content).to eq 'content02'
      expect(posts[0].create_at).to eq '2018-05-25 17:39:49+08'
      expect(posts[0].user_id).to eq '2'

      expect(posts[1].id).to eq '3'
      expect(posts[1].title).to eq 'post03'
      expect(posts[1].content).to eq 'content03'
      expect(posts[1].create_at).to eq '2018-06-25 17:39:49+08'
      expect(posts[1].user_id).to eq '2'

  end


end