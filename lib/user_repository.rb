class UserRepository

    # Selecting all records
    # No arguments
    def all
            result_set = DatabaseConnection.exec_params('SELECT id, user_name, email, password FROM users;',[])
            all_users = []
            result_set.each do |a_user|
              peep = User.new
              peep.id = a_user['id']
              peep.user_name = a_user['user_name']
              peep.email = a_user['email']
              peep.password = a_user['password']
              all_users.push(peep)
            end
            return all_users
          
      
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, title, author_name FROM book WHERE id = $1;
  
      # Returns a single Book object.
    end
end