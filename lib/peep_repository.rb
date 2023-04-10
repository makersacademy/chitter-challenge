require_relative "./database_connection"
require_relative "./peep"

class PeepRespository
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
end