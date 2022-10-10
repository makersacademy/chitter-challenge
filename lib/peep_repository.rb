require_relative './peep'
require_relative './database_connection'

class PeepRepository
  def all
    sql = 'SELECT id, context, time_and_date, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.context = record['context']
      peep.time_and_date = record['time_and_date']
      peep.user_id = record['user_id']
      
      peeps << peep
    end
    return peeps
  end
  
  def create(peep)
    sql = 'INSERT INTO 
            peeps (context, time_and_date, user_id) 
            VALUES($1, $2, $3);'
    sql_params = [peep.context, peep.time_and_date, peep.user_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
        
    return nil
  end
end