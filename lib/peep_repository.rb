require_relative './peep'

class PeepRepository
  def all
    peeps = []
    sql = 'SELECT id, content, time_posted, user_id FROM peeps;'
    sql_params = []
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    result_set.each do |record|
      peeps << record_to_peep_object(record)
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time_posted, user_id) VALUES($1, $2, $3);'
    sql_params = [peep.content, peep.time_posted, peep.user_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  private 

  def record_to_peep_object(record)
    peep = Peep.new 
    peep.id = record['id']
    peep.content = record['content']
    peep.time_posted = record['time_posted']
    peep.user_id = record['user_id']

    return peep
  end
end