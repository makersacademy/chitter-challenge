require_relative 'peep'

class PeepRepository

  # Gets all peeps
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, date_and_time, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets all peeps by given user
  # One argument: the (user)id (number)
  def peeps_by_user(user_id)
    # Executes the SQL query:
    # SELECT id, content, date_and_time, FROM peeps WHERE user_id = $1;

    # Returns all peeps by given User object.
  end

  # creates a new peep
  # takes one argument: a Peep object
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, date_and_time, user_id) VALUES ($1, $2, $3);

    # Returns nil
  end

  # # allows user to delete a peep they've posted
  # def delete(peep)
  #   TBC
  # end
end