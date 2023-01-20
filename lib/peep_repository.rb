require_relative './peep'
require_relative './database_connection'

class PeepRepository

  def all
      
    sql_query = 'SELECT id, content, time_created FROM peeps'
    peep_set = DatabaseConnection.exec_params(sql_query, [])
            
    all_peeps = []
    peep_set.each do |single_peep|
      peep = Peep.new
      peep.id = single_peep['id'].to_i
      peep.content = single_peep['content']
      peep.time_created = single_peep['time_created']
      peep.user_id = single_peep['user_id']
      all_peeps << peep
    end
          
    return all_peeps
  end 

  def create(new_peep)
    sql_query = 'INSERT INTO peeps (content, time_created, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql_query, 
[new_peep.content, new_peep.time_created, new_peep.user_id])
  end
end
