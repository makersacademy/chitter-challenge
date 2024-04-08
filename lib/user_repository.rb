require_relative 'user'
require_relative 'peep_user'

class UserRepository
  def find(id)  # id is a user record id int
    sql = 'SELECT * FROM users WHERE id = $1'
    sql_params = [id]
    record = DatabaseConnection.exec_params(sql, sql_params).first
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.name = record['name']
    user.username = record['username']
    user
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1'
    sql_params = [email]
    record = DatabaseConnection.exec_params(sql, sql_params).first
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.name = record['name']
    user.username = record['username']
    user
  end

  def find_with_mentions(id)
    sql = 
      'SELECT
        users.id, email, name, username,
        peeps_users.id AS peep_user_id,
        peeps_users.peep_id	
      FROM users
      JOIN peeps_users
      ON users.id = peeps_users.user_id
      WHERE users.id = $1;'
    sql_params = [id]
    record_set = DatabaseConnection.exec_params(sql, sql_params)
    first_record = record_set.first
    user = User.new

    user.id = first_record['id'].to_i
    user.email = first_record['email']
    user.name = first_record['name']
    user.username = first_record['username']
    user.mentions = record_set.map do |record|
      mention = PeepUser.new(
        record['peep_user_id'].to_i,
        record['peep_id'].to_i,
        id
      )
    end
    user
  end

  def create(user)  # create record from User object
    sql = 'INSERT INTO users (email, password, name, username)
            VALUES ($1, $2, $3, $4);'
    user_validation_result = validate_user(user)
    if user_validation_result == 'valid'
      sql_params = [user.email, user.password, user.name, user.username]
      DatabaseConnection.exec_params(sql, sql_params)
      return 'success'
    else
      return user_validation_result
    end
  end

  private

  def validate_user(user)
    # TODO further validation
    if !validate_email_address(user.email)
      return 'Email is invalid.'
    else
      return 'valid'
    end
  end

  def validate_email_address(email)
    return email =~ URI::MailTo::EMAIL_REGEXP
  end
end
