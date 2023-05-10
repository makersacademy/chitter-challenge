require_relative './user'
require 'bcrypt'

class UserRepository

  def all
    users = []

    sql = 'SELECT id, name, username, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      users << record_to_user_object(record)
    end
    return users
  end
  
  def record_to_user_object(record)
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']
    return user
  end

  def find(id)
    result_set = fetch_data(id)
    build_user(result_set.first)
  end
  
  
  
  
#   def find_by_email(email)
#     sql = 'SELECT id, name, username, email, password FROM users WHERE email = $1;'
#     result_set = DatabaseConnection.exec_params(sql, [email])
#     return nil if result_set.ntuples.zero?
#     user = User.new
#     user.id = result_set[0]['id'].to_i
#     user.name = result_set[0]['name']
#     user.username = result_set[0]['username']
#     user.email = result_set[0]['email']
#     user.password = result_set[0]['password']
#     return user

#   end

  def find_by_email(email)
    result_set = fetch_data_by_email(email)
    return nil if result_set.ntuples.zero?
  
    build_user(result_set.first)
  end
  
  def create(new_user)
    encrypted_password = encrypt_password(new_user.password)
    sql_params = build_sql_params(new_user, encrypted_password)
    execute_insertion(sql_params)
    new_user
  end
    
    #  def create(new_user)
#       # Encrypt the password to save it into the new database record.
#     encrypted_password = BCrypt::Password.create(new_user.password)
  
#     sql = '
#           INSERT INTO users (name, username, email, password)
#             VALUES($1, $2, $3, $4);
#         '
#     sql_params = [
#       new_user.name,
#       new_user.username,
#       new_user.email,
#       encrypted_password
#     ]
#     result_set = DatabaseConnection.exec_params(sql, sql_params)
#     return new_user
#   end

  private
  
  def fetch_data(id)
    sql = 'SELECT id, name, username, email, password FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end
  
  def build_user(data)
    User.new.tap do |user|
      user.id = data['id'].to_i
      user.name = data['name']
      user.username = data['username']
      user.email = data['email']
      user.password = data['password']
    end
  end

  def fetch_data_by_email(email)
    sql = 'SELECT id, name, username, email, password FROM users WHERE email = $1;'
    DatabaseConnection.exec_params(sql, [email])
  end

  def encrypt_password(password)
    BCrypt::Password.create(password)
  end
  
  def build_sql_params(user, password)
    [
      user.name,
      user.username,
      user.email,
      password
    ]
  end
  
  def execute_insertion(params)
    sql = '
          INSERT INTO users (name, username, email, password)
            VALUES($1, $2, $3, $4);
        '
    DatabaseConnection.exec_params(sql, params)
  end

    # def log_in(email, submitted_password)
    #     user = find_by_email(email)
    
    #     return nil if user.nil?
    
    #     # Compare the submitted password with the encrypted one saved in the database
    #     stored_password = BCrypt::Password.new(user.password)
    #     if stored_password == submitted_password
    #       return  "login success"
    #     else
    #       return "wrong password"
    #     end
    # end

    # def send_tag_email(username, email, content)
    #     mail = Mail.new do
    #       from     'me@test.lindsaar.net'
    #       to       email.to_s
    #       subject  'You have been tagged in a post!'
    #       body     "Hello #{username}, you have been tagged in a post: #{content}"
    #     end
    #     mail.delivery_method :logger
    #     mail.deliver
    # end
end
