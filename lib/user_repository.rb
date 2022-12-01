class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    users = []
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.email = record['email']
      user.password = record['password']

      users << user 
    end 
    return users 
  end

  def create(user)
    sql = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3);'
    params = [user.name, user.email, user.password]

    DatabaseConnection.exec_params(sql,params)
    return nil 
  end 
end 
