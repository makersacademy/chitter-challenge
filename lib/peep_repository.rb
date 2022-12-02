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

  def find_by_id(peep_id)
    sql = 'SELECT id, content, time_posted, user_id FROM peeps WHERE id = $1;'
    sql_params = [peep_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return record_to_peep_object(record)
  end

  def find_by_username(username)
    sql = 'SELECT id, content, time_posted, user_id FROM peeps WHERE username = $1;'
    sql_params = [username]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return record_to_peep_object(record)
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