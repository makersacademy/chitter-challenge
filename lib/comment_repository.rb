require_relative 'comment'

class CommentRepository

  def find(peep_id)
    sql = 'SELECT id, content, comment_time_posted, peep_id, user_id FROM comments WHERE peep_id = $1;'
    params = [peep_id]
    result_set = DatabaseConnection.exec_params(sql, params)
    all_comments = []
    result_set.each do |record|
      comment = Comment.new
      comment.id = record['id']
      comment.content = record['content']
      comment.comment_time_posted = record['comment_time_posted']
      comment.peep_id = record['peep_id']
      comment.user_id = record['user_id']
      all_comments << comment
    end
    all_comments
  end

  def create(comment)
    sql = 'INSERT INTO comments (content, comment_time_posted, peep_id, user_id) VALUES ($1, $2, $3, $4);'
    params = [comment.content,comment.comment_time_posted,comment.peep_id,comment.user_id]
    DatabaseConnection.exec_params(sql, params)
  end
end
