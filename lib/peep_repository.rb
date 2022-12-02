require_relative "peep"
require_relative "database_connection"

class PeepRepository
  def all 
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql,[])
    peeps = []

    result_set.each do |record|
      peep = Peep.new 
      peep.id = record['id'].to_i
      peep.name = record['name']
      peep.username = record['username']
      peep.message = record['message']
      peep.time_created = record['time_created']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (message, time_created, user_id) VALUES ($1, $2, $3);'
    params = [peep.message, peep.time_created, peep.user_id]

    DatabaseConnection.exec_params(sql,params)
    return nil
  end 
end 
