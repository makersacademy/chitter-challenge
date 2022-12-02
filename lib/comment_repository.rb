require_relative 'comment'

class CommentRepository

  # Gets all comments
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, date_and_time, user_id, peep_id FROM comments;

    # Returns an array of Comment objects.
  end

  # Gets all comments by given peep
  # One argument: the (peep)id (number)
  def comments_by_peep(peep_id)
    # Executes the SQL query:
    # SELECT id, content, date_and_time, user_id FROM comments WHERE peep_id = $1;

    # Returns all comments by given Peep object.
  end

  # creates a new comment
    # takes one argument: a Comment object
  def create(comment)
    # Executes the SQL query:
    # INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ($1, $2, $3, $4);

    # Returns nil
  end

  # # allows user to delete a comment they've posted
  # def delete(comment)
  #   TBC
  # end
end