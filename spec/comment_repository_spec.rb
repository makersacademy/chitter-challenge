require 'comment'
require 'comment_repository'

describe CommentRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context 'find(peep_id) method' do
    it 'finds all comments on a post' do
      repo = CommentRepository.new
      comments = repo.find(2)
      first_comment = comments.first
      last_comment = comments.last
      expect(comments.length).to eq 2
      expect(first_comment.content).to eq 'This is a comment'
      expect(first_comment.comment_time_posted).to eq '2022-11-30 12:09:00'
      expect(first_comment.user_id).to eq '3'
      expect(last_comment.content).to eq 'I disagree'
      expect(last_comment.comment_time_posted).to eq '2022-11-30 12:12:00'
      expect(last_comment.user_id).to eq '4'
    end
    it 'still works if no comments have been made' do
      repo = CommentRepository.new
      comments = repo.find(8)
      expect(comments.length).to eq 0
    end
  end

  context 'create method' do
    it 'creates a new comment' do
      repo = CommentRepository.new
      comment = Comment.new
      comment.content = 'I am a test comment'
      comment.comment_time_posted = '2022-11-30 13:35:00'
      comment.user_id = '1'
      comment.peep_id = '3'
      repo.create(comment)
      new_comment = repo.find(3).last
      expect(repo.find(3).length).to eq 2
      expect(new_comment.content).to eq 'I am a test comment'
      expect(new_comment.comment_time_posted).to eq '2022-11-30 13:35:00'
      expect(new_comment.user_id).to eq '1'
      expect(new_comment.peep_id).to eq '3'
    end
  end
end
