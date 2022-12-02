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

  def find(id)

    sql = 'SELECT username, email_address, password, full_name FROM users WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return record_to_user_object(record)

  end 

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record['id']
    user.username = record['username']
    user.email_address = record['email_address']
    # user.password = record['password']
    user.full_name = record['full_name']

    return user
  end

end 