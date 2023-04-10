require_relative "./database_connection"
require_relative "./peep"
require_relative "./user"

class PeepRespository
  # Consider removing this method later on in app development if it is redundant:
  def all_by_rev_date_order
    sql = "SELECT * FROM peeps ORDER BY posted_at DESC;"
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |row|
      peep = Peep.new
      peep.id = row['id'].to_i
      peep.message = row['message']
      peep.posted_at = row['posted_at']
      peep.user_id = row['user_id'].to_i
      peeps << peep
    end
    return peeps
  end

  def all_by_rev_date_order_with_author
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
end
