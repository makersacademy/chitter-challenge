require_relative "./peep"
require_relative "./user"

class PeepRespository
  def all_with_author
    # Returns array of peeps in reverse chronological order
    sql = "SELECT message, posted_at, name, username
            FROM peeps JOIN users ON user_id = users.id
              ORDER BY posted_at DESC;"

    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []

    result_set.each do |row|
      peep = Peep.new
      peep.id = row['id'].to_i
      peep.message = row['message']
      peep.posted_at = row['posted_at']
      peep.user_id = row['user_id'].to_i
      user = User.new
      user.name = row['name']
      user.username = row['username']
      peep.user = user
      peeps << peep
    end
    
    return peeps
  end

  def create(message, timestamp, author_id)
    sql = "INSERT INTO peeps (message, posted_at, user_id) VALUES ($1, $2, $3);"
    params = [message, timestamp, author_id]

    DatabaseConnection.exec_params(sql, params)
  end

  #TODO: add method to scan for user tags

end
