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
    expect(@repo.all.first.time).to eq '15:22:10'
    expect(@repo.all.last.content).to eq 'Thrid content'
  end

  it 'creates a new post object' do
    post = double :post_double, content:'Fourth content',date:'2023-02-08',time:'15:22:09',user_id:2

    @repo.create(post)

    expect(@repo.all.length).to eq 4
    expect(@repo.all.last.content).to eq 'Fourth content'
    expect(@repo.all.last.date).to eq '2023-02-08'
    expect(@repo.all.last.time).to eq '15:22:09'
    expect(@repo.all.last.user_id).to eq 2
  end

  it 'finds a post object with specific id' do
  user = @repo.find(1) 
  expect(user.id).to eq 1
  expect(user.content).to eq 'First content'
  end

  context 'time_difference method' do
    it 'returns a string to indicate the time difference is 1d' do
      now_time = Time.new(2023,2,9,11,30,00)
      time_diff = @repo.time_difference('2023-02-08','11:30:00',now_time)
    expect(time_diff).to eq '08 Feb 2023'
    end
    it 'returns a string to indicate the time difference is 1h' do
      now_time = Time.new(2023,2,8,11,30,00)
      time_diff = @repo.time_difference('2023-02-08','10:30:00',now_time)
    expect(time_diff).to eq '1h'
    end
  end
end
