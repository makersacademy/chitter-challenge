require_relative 'peep'
require_relative 'database_connection'

class PeepRepository
  
  def all
    sql_query = 'SELECT id, message, time_posted, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql_query, [])

    all_peeps = []

    result_set.each do |record|
      new_peep = Peep.new
      new_peep.id = record['id'].to_i
      new_peep.message = record['message']
      new_peep.time_posted = record['time_posted']
      new_peep.user_id = record['user_id'].to_i

      all_peeps << new_peep
    end

    return all_peeps
  end
end
