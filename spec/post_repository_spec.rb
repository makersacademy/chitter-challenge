require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds/posts_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_posts_table
  end

  context "all posts" do
    it "retuns all the posts in anti chronological order" do
      repo = PostRepository.new

      posts = repo.all
      order = posts.first.time_posted > posts.last.time_posted

      expect(posts.length).to eq 7

      expect(posts[0].id).to eq 7
      expect(posts[0].content).to eq 'you really know how to make me cry'
      expect(posts[0].time_posted).to eq '2022-10-08 00:29:00'
      expect(posts[0].user_id).to eq 3
      expect(order).to eq true
    end
  end

  context "find post by id" do
    it "returns the post with id 1" do
      repo = PostRepository.new

      post = repo.find(1)

      expect(post.id).to eq 1
      expect(post.content).to eq "watermelon sugar"
    end
  end

  context "add post" do
    it "adds a post and returns the list" do
      repo = PostRepository.new

      post = Post.new
      post.content = "you know it's not the same"
      post.time_posted = '2022-12-08 09:30:00'
      post.user_id = '1'

      repo.create(post)

      posts = repo.all
      expect(posts.length).to eq 8
      expect(posts.first.id).to eq 8
      expect(posts.first.content).to eq "you know it's not the same"
      expect(posts.first.time_posted).to eq '2022-12-08 09:30:00'
      expect(posts.first.user_id).to eq 1
    end

    it "adds a reply" do
      repo = PostRepository.new

      post = Post.new
      post.content = "hi"
      post.time_posted = '2022-12-08 09:30:00'
      post.user_id = '1'
      post.parent_id = '3'

      repo.create(post)
      posts = repo.all
      expect(posts.length).to eq 8
      expect(posts.first.id).to eq 8
      expect(posts.first.content).to eq "hi"
      expect(posts.first.time_posted).to eq '2022-12-08 09:30:00'
      expect(posts.first.user_id).to eq 1
      expect(posts.first.parent_id).to eq 3
    end
  end

  context "checks for users mentioned" do
    it "returns false if no users are mentioned" do
      repo = PostRepository.new

      post = Post.new
      post.content = "canyon moon"
      post.time_posted = '2022-12-08 09:32:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.user_mentioned?(post)).to eq false
    end

    it "returns false if no users are mentioned" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@no"
      post.time_posted = '2022-12-08 09:36:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.user_mentioned?(post)).to eq false
    end

    it "returns true if a single user is mentioned" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish hi"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.user_mentioned?(post)).to eq true
    end

    it "returns true if a single user is mentioned (2)" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish hi @no"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.user_mentioned?(post)).to eq true
    end

    it "returns true if a multiple users are mentioned" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish @taylor_swift hi"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.user_mentioned?(post)).to eq true
    end
  end

  context "find mentioned users" do
    it "returns true if a single user is mentioned" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish hi"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.mentioned_users(post)).to eq ["billie_eillish@email.com"]
    end

    it "returns true if a single user is mentioned (2)" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish hi @no"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.mentioned_users(post)).to eq ["billie_eillish@email.com"]
    end

    it "returns true if a multiple users are mentioned" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish @taylor_swift hi"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'

      repo.create(post)

      post = repo.find(8)

      expect(repo.mentioned_users(post)).to eq ["billie_eillish@email.com", "taylor_swift@email.com"]
    end
  end

  context "checks for replies" do
    it "returns false if the peep has no replies" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish @taylor_swift hi"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'

      repo.create(post)

      new_post = repo.find(8)

      expect(repo.replies?(new_post)).to eq false
    end

    it "returns true if the peep has replies" do
      repo = PostRepository.new

      post = Post.new
      post.content = "@billie_eillish @taylor_swift hi"
      post.time_posted = '2022-12-08 09:38:00'
      post.user_id = '1'
      post.parent_id = '4'

      repo.create(post)

      new_post = repo.find(4)

      expect(repo.replies?(new_post)).to eq true
    end
  end

  it "returns all the replies to the peep" do
    repo = PostRepository.new

    post = Post.new
    post.content = "@billie_eillish @taylor_swift hi"
    post.time_posted = '2022-12-08 09:38:00'
    post.user_id = '1'
    post.parent_id = '4'
    repo.create(post)

    post2 = Post.new
    post2.content = "@billie_eillish hi"
    post2.time_posted = '2022-12-08 09:38:00'
    post2.user_id = '2'
    post2.parent_id = '4'
    repo.create(post2)

    new_post = repo.find(4)
    expect(repo.all_replies(new_post).length).to eq 2
    expect(repo.all_replies(new_post).first.content).to eq "@billie_eillish @taylor_swift hi"
  end
end
