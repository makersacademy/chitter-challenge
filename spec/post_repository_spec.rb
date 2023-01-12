require_relative '../lib/post'
require_relative '../lib/post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  it "#all will return all posts in the table" do
    repo = PostRepository.new
    posts = repo.all

    expect(posts.length).to eq 6

    expect(posts[0].id).to eq 1
    expect(posts[0].message).to eq 'Tom Riddle is a baddie'
    expect(posts[0].timestamp).to eq '2023-01-08 12:05:06'
    expect(posts[0].user_id).to eq 1
    expect(posts[0].name).to eq 'Harry Potter'
    expect(posts[0].user_name).to eq 'lightning-boy'

    expect(posts[1].id).to eq 2
    expect(posts[1].message).to eq 'gingernut has dirt on his nose'
    expect(posts[1].timestamp).to eq '2023-01-07 15:11:06'
    expect(posts[1].user_id).to eq 3
    expect(posts[1].name).to eq 'Hermione Granger'
    expect(posts[1].user_name).to eq 'clever-cloggs'
  end
end