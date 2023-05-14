require_relative 'peep'
require_relative 'user'

class PeepRepository
  def all_with_user
    peeps = []

    sql = 'SELECT peeps.id, message, timestamp, peeps.user_id, peep_id as parent_id, 
    name, username, email FROM peeps 
    JOIN users ON users.id = peeps.user_id ORDER BY "timestamp" DESC;'

    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      # counts replies for each record
      record['reply_count'] = result_set.count { |result| result['parent_id'] == record['id'] }
      # only add peep if not a reply
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
    sql = 'SELECT peeps.id, message, timestamp, user_id, name, username, email
    FROM peeps
    JOIN users ON users.id = peeps.user_id
    WHERE peep_id IS NULL and peeps.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)
   
    return create_peep(result[0])
  end

  def get_replies(id)
    replies = []

    sql = 'SELECT peeps.id, message, timestamp, user_id, name, username 
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
    user = create_user(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.message = record['message']
    peep.timestamp = format_timestamp(record['timestamp'])
    peep.reply_count = record['reply_count']
    peep.user = user
    peep = get_tags(peep)

    return peep
  end

  def create_user(record)
    user = User.new
    user.id = record['user_id']
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']

    return user
  end

  def get_tags(peep)
    sql = 'SELECT users.id, username, email FROM users
    JOIN peeps_users ON peeps_users.user_id = users.id
    JOIN peeps ON peeps_users.peep_id = peeps.id WHERE peeps.id = $1;'

    params = [peep.id]

    result_set = DatabaseConnection.exec_params(sql, params)
    
    result_set.each do |record|
      peep.tags << create_user(record)
    end
    return peep
  end

  def format_timestamp(timestamp)
    return DateTime.parse(timestamp).strftime '%d %b %Y %H:%M:%S'
  end
end
