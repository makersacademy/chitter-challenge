require_relative 'peep'

class PeepRepository
 
  def all
    peeps = []
    sql = 'SELECT id, content, time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time = record['time']
      peep.user_id = record['user_id']

      peeps << peep
    end
    
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.time, peep.user_id])

    return peep
  end
end