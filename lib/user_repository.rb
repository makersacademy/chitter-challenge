require 'user_model'

class UserRepository

  def all 
    sql_query = 'SELECT id, email, pass_word, username, full_name FROM users'
    user_set = DatabaseConnection.exec_params(sql_query, [])
      
    all_users = []
    user_set.each do |single_user|
      user = User_model.new
      user.id = single_user['id'].to_i
      user.email = single_user['email']
      user.pass_word = single_user['pass_word']
      user.username = single_user['username']
      user.full_name = single_user['full_name']
      all_users << user
    end

    return all_users

  end

  def create(new_user)
    sql_query = 'INSERT INTO users (email, pass_word, username, full_name) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql_query, 
[new_user.email, new_user.pass_word, new_user.username, new_user.full_name])
  end
end
