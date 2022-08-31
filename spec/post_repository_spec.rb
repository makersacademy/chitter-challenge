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
end
