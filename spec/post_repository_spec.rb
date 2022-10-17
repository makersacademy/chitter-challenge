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
    xit "retuns all the posts in anti chronological order" do
      repo = PostRepository.new

      posts = repo.all
      order = posts.first.time_posted > post.last.time_posted

      expect(posts.length).to eq 7

      expect(posts[0].id).to eq 1
      expect(posts[0].content).to eq 'watermelon sugar'
      expect(posts[0].time_posted).to eq '2022-03-10 09:30:00+00', 1
      expect(posts[0].user_id).to eq 1
      expect(order).to eq true
    end
  end

  context "add post" do
    xit "adds a post and returns the list" do
      repo = PostRepository.new

      post = Post.new
      post.content = "you know it's not the same"
      post.time_posted = '2022-08-08 09:30:00+00'
      post.user_id = '1'

      repo.create(post)

      posts = repo.all
      expect(posts.length).to eq 8
      expect(posts.last.id).to eq '8'
      expect(posts.last.content).to eq "you know it's not the same"
      expect(posts.last.time_posted).to eq '2022-08-08 09:30:00+00'
      expect(posts.last.user_id).to eq '1'
    end
  end
end
