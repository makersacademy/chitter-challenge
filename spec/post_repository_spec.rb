require 'post'
require 'post_repository'

def reset_posts_table
    seed_sql = File.read('spec/seeds/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
  end
  
  describe PostRepository do
    before(:each) do 
      reset_posts_table
    end
    it 'returns a list of all messages' do
        repo = PostRepository.new
        posts = repo.all

        expect(posts.length).to eq 8

        expect(posts[0].message).to eq "Friends don't lie"
        expect(posts[0].timestamp).to eq '2023-01-08 12:05:06'
        expect(posts[0].user_id).to eq 1
    end
    it 'finds a single post using its id' do
        repo = PostRepository.new

        post = repo.find(3)

        expect(post.message).to eq "You're all so nerdy, it makes me physically ill"
        expect(post.timestamp).to eq '2023-01-07 16:24:06'
        expect(post.user_id).to eq 6
    end
    it 'creates a new post' do
        repo = PostRepository.new

        new_post = Post.new
        new_post.message = "Sorry, but you ate my cat"
        new_post.timestamp = '2023-01-08 10:12:06'
        new_post.user_id = 3

        repo.create(new_post)

        posts = repo.all

        expect(posts.length).to eq 9
        expect(posts.last.message).to eq "Sorry, but you ate my cat"
        expect(posts.last.timestamp).to eq '2023-01-08 10:12:06'
        expect(posts.last.user_id).to eq 3
    end
    it 'deletes a post' do
        repo = PostRepository.new

        repo.delete(1)
        posts = repo.all

        expect(posts.length).to eq 7
        expect(posts.first.id).to eq 2
    end
end