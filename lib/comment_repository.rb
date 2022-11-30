require_relative './comment'

class CommentRepository
 def find_by_peep(peep_id)
  comments_on_peep = []
  sql = 'SELECT id, content, time_posted, user_id, peep_id FROM comments WHERE peep_id = $1;'
  sql_params = [peep_id]
  result_set = DatabaseConnection.exec_params(sql, sql_params)

  result_set.each do |record|
    comments_on_peep << record_to_comment_object(record)
  end
  return comments_on_peep
 end

 def create(comment)
  sql = 'INSERT INTO comments (content, time_posted, user_id, peep_id) VALUES($1, $2, $3, $4);'
  sql_params = [comment.content, comment.time_posted, comment.user_id, comment.peep_id]
  result_set = DatabaseConnection.exec_params(sql, sql_params)
 end

 private 

 def record_to_comment_object(record)
  comment = Comment.new 
  comment.id = record['id']
  comment.content = record['content']
  comment.time_posted = record['time_posted']
  comment.user_id = record['user_id']
  comment.peep_id = record['peep_id']

  return comment
 end
end