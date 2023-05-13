require_relative 'peep'
require_relative 'user'

class PeepRepository
  def all_with_user
    peeps = []

    sql = 'SELECT peeps.id, message, timestamp, users.id as user_id, peep_id as parent_id, 
    name, username FROM peeps JOIN users ON users.id = peeps.user_id ORDER BY "timestamp" DESC;'

    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      record['reply_count'] = result_set.count { |x| x['parent_id'] == record['id'] }
      peeps << create_peep(record) if record['parent_id'].nil?
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (message, timestamp, user_id, peep_id)
    VALUES($1, CURRENT_TIMESTAMP, $2, $3);'
    
    params = [peep.message, peep.user_id, peep.peep_id]

    DatabaseConnection.exec_params(sql, params)
  end

  def find_by_id(id)
    sql = 'SELECT peeps.id, message, timestamp, users.id as user_id, users.name, users.username
    FROM peeps
    JOIN users ON users.id = peeps.user_id
    WHERE peep_id IS NULL and peeps.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)
   
    return create_peep(result[0])
  end

  def get_replies(id)
    replies = []

    sql = 'SELECT peeps.id, message, timestamp, users.id as user_id, name, username 
    FROM peeps JOIN users ON users.id = peeps.user_id 
    WHERE peep_id = $1;'

    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)

    result_set.each do |record|
      replies << create_peep(record)
    end
    return replies
  end

  private

  def create_peep(record)
    user = create_user(record['name'], record['username'])
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.message = record['message']
    peep.timestamp = format_timestamp(record['timestamp'])
    peep.reply_count = record['reply_count']
    peep.user = user

    return peep
  end

  def create_user(name, username)
    user = User.new
    user.name = name
    user.username = username
    return user
  end

  def format_timestamp(timestamp)
    return DateTime.parse(timestamp).strftime '%d %b %Y %H:%M:%S'
  end
end
