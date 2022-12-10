require_relative './maker'

class MakerRepository

  #list all makers
  def all
    sql = 'SELECT id, name, username, email, password FROM makers;'
    result_set = DatabaseConnection.exec_params(sql, [])

    makers = []

    result_set.each do |user|
      maker = Maker.new

      maker.id = user['id']
      maker.name = user['name']
      maker.username = user['username']
      maker.email = user['email']
      maker.password = user['password']

      makers << maker

    end

    return makers
  end

  # find a maker based on id
  def find(id)
    sql = 'SELECT id, name, username, email, password FROM makers WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    new_user = Maker.new

    new_user.id = result_set[0]['id']
    new_user.name = result_set[0]['name']
    new_user.username = result_set[0]['username']
    new_user.email = result_set[0]['email']
    new_user.password = result_set[0]['password']

    return new_user

  end

  # login option
  def find_by_values(email, password)
    sql = "SELECT id, name, username, email, password FROM makers WHERE (email = $1 AND password = $2);"
    sql_params = [email, password]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    if result_set.num_tuples.zero?
      puts 'empty result'
    end

    user = Maker.new
    user.id = result_set[0]['id']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']

    return user
  end

  # create a new maker account
  def create(new_user)
    sql = 'INSERT INTO makers (name, username, email, password)
      VALUES ($1, $2, $3, $4);'
    sql_params = [new_user.name, new_user.username, new_user.email, new_user.password]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
  
   # find by email to prevent signup with the same email
  def find_by_email(email)
    sql = 'SELECT id, username, email, password FROM makers WHERE (email = $1);'
    sql_params = [email]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  
    if result_set.num_tuples.zero?
      return nil
    end
  
    user = Maker.new
    user.id = result_set[0]['id']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
      return user
  end

  # find by username to prevent signup with the same username
  def find_by_name(username)
    sql = 'SELECT id, username, name, email, password FROM makers WHERE (username = $1);'
    sql_params = [username]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  
    if result_set.num_tuples.zero?
      return nil
    end
  
    user = Maker.new
    user.id = result_set[0]['id']
    user.username = result_set[0]['username']
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
      return user
  end
end


  # def find(id)
  #   # Executes the SQL query:
  #   # SELECT id, name, username, email, password FROM makers WHERE id = $1;

  #   # Returns a single post object.
  # end

  # def create(user_account)
  #   # INSERT INTO Maker
  #   # (name, username, email, password)
  #   # VALUES (user_account.name, user_account.username, user_account.email, user_account.password);
  #   # returns nil
  # end