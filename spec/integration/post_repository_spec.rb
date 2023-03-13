require_relative '../../lib/post_repository'
require_relative '../../lib/post'

def reset_posts_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  context '#all' do
    it 'returns all items in table' do
      repo = PostRepository.new

      posts = repo.all

      expect(posts.length).to eq(4)
      expect(posts[0].id).to eq(2)
      expect(posts[0].message).to eq('Shotguns? What, like guns that fire shot?')
      expect(posts[0].datetime).to eq('2022-10-18 04:05:06') # hashed pass
      expect(posts[0].user_id).to eq('2')
    end
  end

  context '#create' do
   it 'creates new post in db and returns user/pass' do
      repo = PostRepository.new
      new_post = Post.new

      new_post.message = 'we should have been rocket scientists, or Nobel Peace Prize winners … something.'
      new_post.user_id = 3
      repo.create(new_post)

      posts = repo.all

      expect(posts.length).to eq(5)
      expect(posts[0].id).to eq(5)
      expect(posts[0].message).to eq('we should have been rocket scientists, or Nobel Peace Prize winners … something.')
      expect(posts[0].user_id).to eq('3') # hashed pass
    end
  end

  context '#find' do
    it 'find specific record in post tablee' do
      repo = PostRepository.new

      post = repo.find(3)


      expect(post[0].id).to eq(3)
      expect(post[0].message).to eq('Yeah. You must be Harry. Sorry, didnt know your father.')
      expect(post[0].user_id).to eq('1')
    end
  end

end
