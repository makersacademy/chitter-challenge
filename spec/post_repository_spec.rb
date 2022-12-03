require 'post_repository'

RSpec.describe PostRepository do 

  def reset_posts_table
    seed_sql = File.read('spec/seeds_chitter_challenge.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
  
  describe PostRepository do
    before(:each) do 
      reset_posts_table
    end
  
    it 'Get all posts' do 
      repo = PostRepository.new

      posts = repo.all

      expect(posts.length).to eq 4

      expect(posts.first).to have_attributes(
        id: 1,
        content: 'This is an example post from username firstname',
        time: '2022-01-08 04:05:06',
        user_id: 1,
        name: 'First Name',
        username: 'firstname',
      )
      expect(posts.last).to have_attributes(
        id: 4,
        content: 'This is another example post from username secondname',
        time: '2022-01-09 20:00:06',
        user_id: 2,
        name: 'Second Name',
        username: 'secondname',
      )
    end

    it 'Get a single post' do 
      repo = PostRepository.new

      post = repo.find(1)

      expect(post).to have_attributes(
        id: 1,
        content: 'This is an example post from username firstname',
        time: '2022-01-08 04:05:06',
        user_id: 1,
        name: 'First Name',
        username: 'firstname',
      )
    end

    it 'Creates a new post' do
      timestamp = double(:fake_timestamp)
      expect(timestamp).to receive(:now).and_return('2022-11-08 04:05:08')

      repo = PostRepository.new(timestamp)

      post = Post.new
      post.content = 'This is an example test post from username secondname'
      post.user_id = 2

      repo.create(post)
      posts = repo.all

      expect(posts.last).to have_attributes(
        id: 5,
        content: 'This is an example test post from username secondname',
        time: '2022-11-08 04:05:08',
        user_id: 2,
        name: 'Second Name',
        username: 'secondname',
      )
    end
  end
end
