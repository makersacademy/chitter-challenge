require_relative 'user'

class UserRepository

	def all 
		users = []

    sql = 'SELECT id, username, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|

      user = User.new
      user.id = record['id'].to_i
      user.username = record['username']
      user.email = record['email']

      users << user
    end

    return users
	end

	def find(id)
		sql = 'SELECT id, username, email FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']

    return user
	end

end