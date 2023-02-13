require 'comment_repository'

def reset_comments_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe CommentRepository do
  before(:each) do 
    reset_comments_table
    @repo = CommentRepository.new
  end


  it 'returns a list of comment objects' do
    expect(@repo.all.length).to eq 2 
    expect(@repo.all.first.content).to eq 'First comment'
    expect(@repo.all.first.date).to eq '2023-02-08'
    expect(@repo.all.first.time).to eq '15:22:10'
    expect(@repo.all.last.content).to eq 'Second comment'
  end

  it 'creates a new post object' do
    comment = double :post_double, content:'Thrid comment',date:'2023-02-08',time:'15:22:09',user_id:2, post_id:1

    @repo.create(comment)

    expect(@repo.all.length).to eq 3
    expect(@repo.all.last.content).to eq 'Thrid comment'
    expect(@repo.all.last.date).to eq '2023-02-08'
    expect(@repo.all.last.time).to eq '15:22:09'
    expect(@repo.all.last.user_id).to eq 2
    expect(@repo.all.last.post_id).to eq 1
  end

  it 'finds a post object with specific post_id' do
  comments = @repo.find_by_post(1) 
  expect(comments.length).to eq 2
    expect(comments.first.content).to eq 'First comment'
  end

end
