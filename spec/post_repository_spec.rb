require 'post_repository'
require 'post'

RSpec.describe PostRepository do
  def reset_table
      seed_sql = File.read('spec/seeds.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
      connection.exec(seed_sql)
  end
      
    describe PostRepository do
      before(:each) do 
        reset_table
      end
      
      it 'finds all posts' do
        repo = PostRepository.new
      
        posts = repo.all
          
        expect(posts.length).to eq(2)
        expect(posts.first.time).to eq('2023-01-08 10:30:00')
      end 

      it 'creates a new post' do
        repo = PostRepository.new
    
        new_post = Post.new
        new_post.peep = 'Hello World'
        new_post.time = '2023-01-10 10:00'
        new_post.user_id = '3'
        repo.create(new_post)
        
        posts = repo.all

        expect(posts.length).to eq(3)
        expect(posts.last.user_id).to eq('3')
      end

      it 'finds a post by specific user' do
        repo = PostRepository.new

        post = repo.find(1)

        expect(post.peep).to eq('this is my first post')
        expect(post.time).to eq('2023-01-08 10:30:00')
      end
    end

end