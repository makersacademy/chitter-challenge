require 'comment_repository'


def reset_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe CommentRepository do
  
  before(:each) do 
    reset_tables
  end

  describe "#all" do
    it "returns all comments" do
      repo = CommentRepository.new
      comments = repo.all

      expect(comments.length).to eq (4)
      expect(comments.first.id).to eq ('1')
      expect(comments.first.content).to eq ('You beat me to it!!')
      expect(comments.first.date_and_time).to eq ('2022-11-30 17:05:11')
      expect(comments.first.user_id).to eq ('2')
      expect(comments.first.peep_id).to eq ('1')

      expect(comments.last.id).to eq ('4')
      expect(comments.last.content).to eq ('Did you leave it in the bath again??')
      expect(comments.last.date_and_time).to eq ('2022-12-01 19:34:54')
      expect(comments.last.user_id).to eq ('3')
      expect(comments.last.peep_id).to eq ('5')
    end
  end

  describe "#comments_by_peep(id_of_peep)" do
    it "gets all comments for given peep" do
      repo = CommentRepository.new
      comments_by_peep = repo.comments_by_peep(1)

      expect(comments_by_peep.length).to eq (3)
      expect(comments_by_peep.first.id).to eq ('1')
      expect(comments_by_peep.first.content).to eq ('You beat me to it!!')
      expect(comments_by_peep.first.date_and_time).to eq ('2022-11-30 17:05:11')
      expect(comments_by_peep.first.user_id).to eq ('2')

      expect(comments_by_peep.last.id).to eq ('3')
      expect(comments_by_peep.last.content).to eq ('In your dreams lol')
      expect(comments_by_peep.last.date_and_time).to eq ('2022-11-30 17:21:40')
      expect(comments_by_peep.last.user_id).to eq ('2')
    end
  end

  describe "#create(comment)" do
    it "adds a comment to a peep" do
      new_comment = Comment.new
      new_comment.content = 'New test comment'
      new_comment.date_and_time = '2022-12-01 20:40:14'
      new_comment.user_id = 3
      new_comment.peep_id = 5
      
      repo = CommentRepository.new
      repo.create(new_comment)

      comments = repo.all

      expect(comments.length).to eq (5)
      expect(comments.last.id).to eq ('5')
      expect(comments.last.content).to eq ('New test comment')
      expect(comments.last.date_and_time).to eq ('2022-12-01 20:40:14')
      expect(comments.last.user_id).to eq ('3')
      expect(comments.last.peep_id).to eq ('5')
    end
  end

  describe "record_into_comment(record)" do
    it "takes a record and turns in into a Comment" do
      repo = CommentRepository.new
      sql = "SELECT id, content, date_and_time, user_id, peep_id FROM comments WHERE peep_id = $1;"
      params = [5]
      result_set = DatabaseConnection.exec_params(sql, params)
      comments = []
      result_set.each do |record|
        comments << repo.record_into_comment(record)
      end

      expect(comments.last.id).to eq ("4")
      expect(comments.last.content).to eq ("Did you leave it in the bath again??")
      expect(comments.last.date_and_time).to eq ("2022-12-01 19:34:54")
      expect(comments.last.user_id).to eq ("3")
      expect(comments.last.peep_id).to eq ("5")
    end
  end
end