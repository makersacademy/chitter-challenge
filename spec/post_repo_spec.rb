require 'post_repo'
require 'post'
require 'date'

def reset_table
  seed_sql = File.read('spec/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PostRepo do
  before(:all) do
    reset_table
    @repo = PostRepo.new
  end
  after(:all) { reset_table }

  context 'runs the .all method' do
    it 'returns all posts' do
      expect(@repo.all.length).to eq(2)
      expect(@repo.all[0].message).to eq('hello1')
      expect(@repo.all[0].name).to eq('name1')
      expect(@repo.all[0].username).to eq('username1')
    end
  end

  context 'runs the .create method' do
    it 'adds a post to the database' do
      post = Post.new

      post.post_time = '2010-10-10 10:10:10'
      post.message = 'test'
      post.user_id = '2'
      @repo.create(post)
      expect(@repo.all.length).to eq(3)
      expect(@repo.all.last.message).to eq('test')
    end
  end

  context 'runs the .delete method' do
    it 'deletes a user from the database' do
      @repo.delete(3)
      expect(@repo.all.length).to eq(2)
    end
  end

  context 'runs the .messages method' do
    it 'returns just the messages' do
    end
  end


end
