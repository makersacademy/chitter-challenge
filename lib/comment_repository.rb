require_relative 'comment'

class CommentRepository

  # Gets all comments
  # No arguments
  def all
    # Executes the SQL query:
    sql = "SELECT id, content, date_and_time, user_id, peep_id FROM comments;"
    params = []

    result_set = DatabaseConnection.exec_params(sql, params)

    comments = []

    result_set.each do |record|
      comments << record_into_comment(record)
    end

    return comments
  end

  # Gets all comments on given peep
  # One argument: the (peep)id (number)
  def comments_by_peep(id_of_peep)
    # Check if peep_id exists, raise error if it doesn't
    result_set_1 = DatabaseConnection.exec_params("SELECT id FROM peeps", [])

    existing_peep_ids = []

    result_set_1.each do |record|
      peep_id = record["id"]
      existing_peep_ids << peep_id
    end

    raise "There is no peep at this address" if !existing_peep_ids.include?(id_of_peep.to_s)
    
    
    # Gets all comments by given peep
    # Executes the SQL query:
    sql = "SELECT id, content, date_and_time, user_id, peep_id FROM comments WHERE peep_id = $1;"
    params = [id_of_peep]

    result_set_2 = DatabaseConnection.exec_params(sql, params)

    comments = []

    result_set_2.each do |record|
      comments << record_into_comment(record)
    end

    return comments
  end

  # creates a new comment
  # takes one argument: a Comment object
  def create(comment)
    raise "Comments must be at least 1 character long" if comment.content == ""
    
    # Executes the SQL query:
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