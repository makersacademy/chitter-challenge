require_relative 'peep'

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, contents, time, and user_id FROM peeps;

    # Returns an array of peep objects.
  end

  def find(id)
    # executes the SQL query: 
    # SELECT id, contents, time, and user_id FROM peeps WHEN id = $1; 

    #returns a single user 
  end 

  def create(user)
    # executes the SQL query: 
    # INSERT INTO peeps (contents, time, user_id) VALUES($1, $2, $3);

    # returns nothing 
  end
end