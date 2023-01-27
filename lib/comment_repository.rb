require_relative 'comment'

class CommentRepository

  # Gets all comments
  def all
    sql = "SELECT id, content, date_and_time, user_id, peep_id FROM comments;"
    params = []
    result_set = DatabaseConnection.exec_params(sql, params)
    comments = []
    result_set.each do |record|
      comments << record_into_comment(record)
    end
    return comments
  end

  # Gets all comments for the given peep
  def comments_by_peep(id_of_peep)
    sql = "SELECT id, content, date_and_time, user_id, peep_id FROM comments WHERE peep_id = $1;"
    params = [id_of_peep]
    result_set = DatabaseConnection.exec_params(sql, params)
    comments = []
    result_set.each do |record|
      comments << record_into_comment(record)
    end
    return comments
  end

  # Creates a new comment
  def create(comment)
    sql = "INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ($1, $2, $3, $4);"
    params = [comment.content, comment.date_and_time, comment.user_id, comment.peep_id]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  # converts a record from the database connection result set into a Comment object
  def record_into_comment(record)
    comment = Comment.new
    comment.id = record["id"]
    comment.content = record["content"]
    comment.date_and_time = record["date_and_time"]
    comment.user_id = record["user_id"]
    comment.peep_id = record["peep_id"]
    return comment
  end
end