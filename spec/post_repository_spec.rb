require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  context "PostRespository" do
    it "can get a list of all posts" do
      repo = PostRepository.new

      posts = repo.all

      expect(posts.length).to eq(3)
      expect(posts.first.id).to eq (1)
      expect(posts.first.message).to eq('Deployed')
  end

    it "can retrieve a single post" do
      repo = PostRepository.new

      post = repo.find(1)
      expect(post.message).to eq('Deployed')
      expect(post.message_time).to eq('2022-12-02 14:20:00')
    end

    it "can create a new post" do
      repo = PostRepository.new

      post = Post.new
      post.message = 'More deployment'
      post.message_time = '2022-12-02 14:50:00'
      post.user_id = '1'    
      
      posts = repo.all
      repo.create(post)
      
      last_post = posts.last
      
      expect(last_post.message).to eq ('Deployer')
      expect(last_post.message_time).to eq ('2022-12-02 12:20:00')
    end

    it "can delete a post" do
      repo = PostRepository.new
      posts = repo.all
      repo.delete(1)

      expect(posts.length).to eq(3)
      expect(posts.first.id).to eq(1)
    end

    it "can update a post" do
      repo = PostRepository.new

      post = repo.find(1)

      post.message = 'Deployment completed again'
      post.message_time = '2022-12-02 10:20:00'

      repo.update(post)

      updated_post = repo.find(1)

      expect(updated_post.message).to eq('Deployment completed again')
      expect(updated_post.message_time).to eq('2022-12-02 10:20:00')
      end
    end
  end
