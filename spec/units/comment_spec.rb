require 'database_helpers'
require 'comment'
require 'peep'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      maker = User.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username')
      peep = Peep.create("this is a new peep")
      comment = Comment.create(comment: "this is a new comment", peep: peep.id, maker: maker.id)

      persisted_data_comment = persisted_data_comments(id: comment.id)
      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data_comment.first['id']
      expect(comment.comment).to eq 'this is a new comment'
    end
  end
end
