require_relative 'peep'
require_relative 'user'

class PeepRepository
  def all_with_user
    peeps = []

    sql = 'SELECT peeps.id as peep_id, message, timestamp, users.id as user_id, name, username 
    FROM peeps 
    JOIN users ON users.id = peeps.user_id WHERE peep_id IS NULL 
    ORDER BY "timestamp" ASC;'

    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|    
      peeps << create_peep(record)
    end
    
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (message, timestamp, user_id)
    VALUES($1, CURRENT_TIMESTAMP, $2);'

    params = [peep.message, peep.user_id]

    DatabaseConnection.exec_params(sql, params)
  end

  # def find_by_id(id)
  #   # Finds a single peep (for replies)
  #   # Takes an id as an argument
  #   # Returns a single peep

  #   SQL = '
  #   SELECT peeps.id, message, timestamp, users.id as user_id, users.name, users.username
  #   FROM peeps
  #   JOIN users ON users.id = peeps.user_id
  #   WHERE peep_id IS NULL and peeps.id = $1;'

  #   #### Need to get the replies
  # end

  private

  def create_peep(record)
    user = User.new
    user.name = record['name']
    user.username = record['username']

    peep = Peep.new
    peep.id = record['peep_id'].to_i
    peep.message = record['message']
    peep.timestamp = record['timestamp']
    peep.user = user

    return peep
  end
end
