require "PostsRepository"

def reset_users_posts_table
  seed_sql = File.read('spec/schemas-tables/seeds_users_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
RSpec.describe PostsRepository do
  before(:each) do 
    reset_users_posts_table
  end

  context "Users repo correctly intergrates with database" do 
    it "shows all items in database correctly" do 
      repo = PostsRepository.new
      posts = repo.all
        posts

      expect(posts.length).to eq  6

      expect(posts[1].id).to eq  "2"
      expect(posts[1].content).to eq  'hot take: vine is the american dream'
      expect(posts[1].date_created).to eq  '12/6/22'
      expect(posts[1].user_id).to eq '5'

      expect(posts[2].id).to eq  "3"
      expect(posts[2].content).to eq 'i always daydream about how kanye west will save the economy'
      expect(posts[2].date_created).to eq  '12/6/22'
      expect(posts[2].user_id).to eq '4'
    end
    
    it "Gets a single user" do
      repo = PostsRepository.new
      user = repo.find(6)

      expect(user.id).to eq  "6"
      expect(user.content).to eq  'u know what pisses me off? the fact that the dark side of the moon is fake.'
      expect(user.date_created).to eq  "12/6/22"
      expect(user.user_id).to eq '1'
    end
     it 'create a single post' do
      repo = PostsRepository.new
      post = Post.new
      
      post.content =   'new_content'
      post.date_created = "12:11"
      post.user_id =  "3"

      repo.create(post)
      posts = repo.all
      
      expect(posts.length).to eq 7
      expect(posts[6].id).to eq "7"
      expect(posts[6].content).to eq  'new_content'
      expect(posts[6].date_created).to eq  "12:11"
      expect(posts[6].user_id).to eq  "3"
    end 
     it 'update a post' do
      repo = PostsRepository.new
      user = repo.find(3)

      user.content = 'rubies_new'
      repo.update(user)
      posts = repo.all

      expect(posts[5].id).to eq "3"
      expect(posts[5].content).to eq  'rubies_new'
      expect(posts[5].date_created).to eq "12/6/22"
      expect(posts[5].user_id).to eq "4"
    end 
     it 'delete an user' do
      repo = PostsRepository.new
      user = repo.find(1)
      repo.delete(user)

      posts = repo.all
      expect(posts.length).to eq  5
    end
    it 'finds a user relavent to post' do 
      repo = PostsRepository.new
      post = repo.find(1)
      user = repo.find_user_by_post(post)

      expect(user.username).to eq "rico-franco"
    end 
  end
end 