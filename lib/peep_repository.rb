require_relative 'peep'

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps;
  
    # Returns an array of Peep objects.
  end
  
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);
  
    # returns nil
  end
  
  def find_by_owner(user_id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps WHERE user_id = $1;
  
    # Returns an array of Peep objects.
  end
  
end