require 'post_repository'

RSpec.describe PostRepository do 

  def reset_users_table
    seed_sql = File.read('spec/seeds_chitter_challenge.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
  
  describe PostRepository do
    before(:each) do 
      reset_users_table
    end
  
    it 'Get all posts' do 
      repo = PostRepository.new

      posts = repo.all

      expect(posts.length).to eq 4
      expect(posts[0].id).to eq 1
      expect(posts[0].content).to eq 'This is an example post from username firstname'
      expect(posts[0].time).to eq '2022-01-08 04:05:06'
      expect(posts[0].user_id).to eq 1
      expect(posts[0].name).to eq 'First Name'
      expect(posts[0].username).to eq 'firstname'
      expect(posts[1].id).to eq 2
      expect(posts[1].content).to eq 'This is another example post from username firstname'
      expect(posts[1].time).to eq '2022-01-09 18:00:05'
      expect(posts[1].user_id).to eq 1
      expect(posts[1].name).to eq 'First Name'
      expect(posts[1].username).to eq 'firstname'

    end

    
    it 'Get a single post' do 
      repo = PostRepository.new

      post = repo.find(1)

      expect(post.id).to eq 1
      expect(post.content).to eq 'This is an example post from username firstname'
      expect(post.time).to eq '2022-01-08 04:05:06'
      expect(post.user_id).to eq 1
    end

    it 'Creates a new post' do 
      repo = PostRepository.new

      post = Post.new
      post.content = 'This is an example test post from username secondname'
      post.time = '2022-11-08 04:05:08'
      post.user_id = 2

      repo.create(post)

      all_posts = repo.all
      last_post = all_posts.last

      expect(last_post.content).to eq 'This is an example test post from username secondname'
      # expect(last_post.time).to eq '2022-11-08 04:05:08'
      expect(last_post.user_id).to eq 2
    end
  end
end
