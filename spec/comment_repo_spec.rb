require 'comment_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_test_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe CommentRepository do
  before(:each) do 
    reset_tables
  end

  it 'gets all comments related to a peep' do 
    repo = CommentRepository.new

    comments = repo.find_by_peep(2)

    expect(comments.length).to eq(1)
    expect(comments.first.content).to eq('wow amazing')
  end

  it 'creates a new comment' do 
    repo = CommentRepository.new

    new_comment = Comment.new
    new_comment.content = 'New comment / reply'
    new_comment.time_posted = '2022-11-30 22:13:04'
    new_comment.user_id = 3
    new_comment.peep_id = 2

    repo.create(new_comment)

    comments = repo.find_by_peep(2)

    expect(comments.length).to eq(2)
    expect(comments.first.content).to eq('wow amazing')
    expect(comments.last.content).to eq('New comment / reply')
  end
end