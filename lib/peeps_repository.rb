require_relative 'peeps'


class PeepsRepository

  def all
    sql = 'SELECT id, peep_content, time_of_peep, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    all_peeps = []
    result_set.each do |record|
      peep = Peeps.new
      peep.id = record['id'].to_i
      peep.peep_content = record['peep_content']
      peep.time_of_peep = record['time_of_peep']
      peep.user_id = record['user_id'].to_i
      all_peeps << peep
    end
      return all_peeps
  end 

  def find(id)
  sql = 'SELECT id, peep_content, time_of_peep, user_id FROM peeps WHERE id = $1;'
  result_set = DatabaseConnection.exec_params(sql, [id])
  record = result_set.first
  peep = Peeps.new
  peep.time_of_peep = DateTime.parse record['time_of_peep']
  peep.peep_content = record['peep_content']
  peep.user_id = record['user_id'].to_i
  return peep
  end


  def create(peep)
    sql = "INSERT INTO peeps (peep_content, time_of_peep, user_id) VALUES ($1, $2, $3)"
    sql_params = [peep.peep_content, peep.time_of_peep, peep.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end
end
