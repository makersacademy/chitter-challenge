class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, timestamp, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  def find_by_user_id(user_id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE user_id = $1;

    # Returns an array of Peep objects associated to a user.
  end
  # Add more methods below for each operation you'd like to implement.

  def post(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3)
  end

  def delete(peep) # peep is a instance of Peep class
    # Executes the SQL query:
    # DELETE FROM peeps WHERE id = $1 
  end
end