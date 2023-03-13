require_relative 'user'
class UserRepository

    # Selecting all records
    # No arguments
    def all
            result_set = DatabaseConnection.exec_params('SELECT id, user_name, email, password FROM users;',[])
            all_users = []
            result_set.each do |a_user|
              user = User.new
              user.id = a_user['id']
              user.user_name = a_user['user_name']
              user.email = a_user['email']
              user.password = a_user['password']
              all_users.push(user)
            end
            return all_users
          
      
    end
  
    # Gets a single record by its ID
   
end