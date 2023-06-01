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
    sql = 'SELECT id, name, email, password FROM makers WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    
    maker = Maker.new
    maker.id = result_set[0]['id'].to_i
    maker.name = result_set[0]['name']
    maker.email = result_set[0]['email']
    maker.password = result_set[0]['password']
    
    return maker
  end
  
  def create(maker)
    sql = 'INSERT INTO makers (name, email, password) VALUES($1, $2, $3);'
    DatabaseConnection.exec_params(sql, [maker.name, maker.email, maker.password])
  end
end
