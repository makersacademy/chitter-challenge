require_relative 'user'
class UserRepository

  def all
    
    sql = 'SELECT id, username, email_address, password, full_name FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    @all_users = []

    result_set.each do |record|
      @all_users << record_to_user_object(record)

    end

    return @all_users
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    if submitted_password == user.password
      # login success
    else
      # wrong password
    end
  end

  def find_by_email(email)

    sql = 'SELECT id, username, email_address, password, full_name FROM users WHERE email_address = $1;'
    sql_params = [email]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return record_to_user_object(record)

  end 

  def find_by_id(id)

    sql = 'SELECT id, username, email_address, password, full_name FROM users WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return record_to_user_object(record)

  end 

 
  def create(user)
      
      sql = 'INSERT INTO users (username, email_address, password, full_name ) VALUES($1, $2, $3, $4);'
      sql_params = [user.username, user.email_address, user.password, user.full_name]
      DatabaseConnection.exec_params(sql, sql_params)
  end
  

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record['id']
    user.username = record['username']
    user.email_address = record['email_address']
    user.password = record['password']
    user.full_name = record['full_name']

    return user
  end

end 