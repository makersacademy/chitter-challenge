require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT id, peep_content, time_posted, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.peep_content = record['peep_content']
      peep.time_posted = record['time_posted']
      peep.user_id = record['user_id']
      peeps << peep
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (peep_content, time_posted, user_id ) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, 
[peep.peep_content, peep.time_posted, peep.user_id])
    return peep
  end

  def find(id)
    sql = 'SELECT id, peep_content, time_posted, user_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.peep_content = result_set[0]['peep_content']
    peep.time_posted = result_set[0]['time_posted']
    peep.user_id = result_set[0]['user_id']
    return peep
  end
end
