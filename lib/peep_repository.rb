class PeepRepository
  # Initialises peep repository with timer
  # timer is an object with a #now method
  def initialize(timer=Time)
  end

  # Selecting all records in reverse chronological order
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, contents, time_posted, account_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, contents, time_posted, account_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # Creates a new peep in the database (we set the time posted in this method)
  # peep is an instance of the Peep class
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (contents, time_posted, account_id) VALUES ($1, $2, $3);

    # Returns nothing.
  end
end