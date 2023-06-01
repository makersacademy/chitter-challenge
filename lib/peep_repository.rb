require_relative 'peep'

class PeepRepository
  def all
    peeps = []
    
    sql = 'SELECT id, content, time, maker_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.time = record['time']
      peep.maker_id = record['maker_id']
    
      peeps << peep
    end
    
    return peeps
  end
  
  def find(id)
    sql = 'SELECT id, content, time, maker_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    
    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.content = result_set[0]['content']
    peep.time = result_set[0]['time']
    peep.maker_id = result_set[0]['maker_id'].to_i
    
    return peep
  end
  
  def create(maker)
    sql = 'INSERT INTO makers (name, email, password) VALUES($1, $2, $3);'
    DatabaseConnection.exec_params(sql, [maker.name, maker.email, maker.password])
  end
end
