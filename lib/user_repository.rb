class UserRepository

    # Selecting all records
    # No arguments
    def all
      
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, title, author_name FROM book WHERE id = $1;
  
      # Returns a single Book object.
    end