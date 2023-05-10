require_relative './peep'
class PeepRepository
  def all
    peeps = []

    sql = 'SELECT id, content, time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
      
    result_set.each do |record|
      peeps << record_to_peep_object(record)
    end
    return peeps
  end
  
  def record_to_peep_object(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.time = record['time']
    peep.user_id = record['user_id'].to_i
    return peep
  end

  # def find(id)
  #   sql = 'SELECT id, content, time, user_id FROM peeps WHERE id = $1;'
  #   result_set = DatabaseConnection.exec_params(sql, [id])
  #   peep = Peep.new
  #   peep.id = result_set[0]['id'].to_i
  #   peep.content = result_set[0]['content']
  #   peep.time = result_set[0]['time']
  #   peep.user_id = result_set[0]['user_id'].to_i
  #   return peep
  # end
  
  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.time, peep.user_id])
    return nil
  end

  def find(id)
    result_set = fetch_data(id)
    build_peep(result_set.first)
  end
  
  private
  
  def fetch_data(id)
    sql = 'SELECT id, content, time, user_id FROM peeps WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end
  
  def build_peep(data)
    Peep.new.tap do |peep|
      peep.id = data['id'].to_i
      peep.content = data['content']
      peep.time = data['time']
      peep.user_id = data['user_id'].to_i
    end
  end
  

end
