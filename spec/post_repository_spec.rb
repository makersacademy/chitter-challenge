require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/chitter_test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  describe '#all' do
    it 'returns array of all posts' do

      repo = PostRepository.new
      posts = repo.all

      expect(posts.length).to eq 5

      expect(posts[0].id).to eq 1
      expect(posts[0].content).to eq 'Ate beans LOL'
      expect(posts[0].post_time).to eq '2021-08-09 13:57:40'
      expect(posts[0].tagged_users).to eq 'jem341'
      expect(posts[0].user_id).to eq 1

      expect(posts[4].id).to eq 5
      expect(posts[4].content).to eq 'Going on a diet after eating a beige buffet for lunch'
      expect(posts[4].post_time).to eq '2022-01-09 13:57:40'
      expect(posts[4].tagged_users).to eq 'ted453'
      expect(posts[4].user_id).to eq 3
    end
  end
  describe '#find' do
    it 'returns post object for id=1' do
      repo = PostRepository.new

      post = repo.find(1)
      expect(post.id).to eq 1
      expect(post.content).to eq 'Ate beans LOL'
      expect(post.post_time).to eq '2021-08-09 13:57:40'
      expect(post.tagged_users).to eq 'jem341'
      expect(post.user_id).to eq 1
    end
    it 'returns post object for id=3' do
      repo = PostRepository.new

      post = repo.find(3)
      expect(post.id).to eq 3
      expect(post.content).to eq 'Wrote a message to Makers today saying how good the course is'
      expect(post.post_time).to eq '2022-08-31 20:57:40'
      expect(post.tagged_users).to eq 'user123'
      expect(post.user_id).to eq 2
    end
  end
  describe '#create' do
    it 'adds a post to the database' do
      repo = PostRepository.new
      post = Post.new
      post.content = 'Ed Balls'
      post.post_time = '2019-01-20 14:20:00'
      post.tagged_users = ''
      post.user_id = '3'

      repo.create(post)
      all_posts = repo.all

      expect(all_posts.length).to eq 6
      expect(all_posts.last.content).to eq 'Ed Balls'
      expect(all_posts.last.post_time).to eq '2019-01-20 14:20:00'
      expect(all_posts.last.user_id).to eq 3
    end
  end
end
