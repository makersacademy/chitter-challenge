require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
    @repo = PostRepository.new
  end


  it 'returns a list of post objects' do
    expect(@repo.all.length).to eq 3 
    expect(@repo.all.first.content).to eq 'First content'
    expect(@repo.all.first.date).to eq '2023-02-08'
    expect(@repo.all.first.time).to eq '15:22:09.648947'
    expect(@repo.all.last.content).to eq 'Thrid content'
  end
end
