require_relative 'peep'

class PeepRepository
  def all
    peeps = []
    
    sql = 'SELECT makers.id AS maker_id,
         makers.name AS maker_name,
         makers.email AS maker_email,
         peeps.id AS peep_id,
         peeps.content AS peep_content,
         peeps.time AS peep_time
    FROM makers
    JOIN peeps ON peeps.maker_id = makers.id
    ORDER BY peep_time DESC;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['peep_id'].to_i
      peep.content = record['peep_content']
      peep.time = record['peep_time']
      peep.maker_id = record['maker_id']
      peep.maker_name = record['maker_name']
    
      peeps << peep
    end
    return peeps
  end
  
  def find(id)
    sql = 'SELECT peeps.id,
         peeps.content,
         peeps.time,
         makers.id AS maker_id,
         makers.name AS maker_name
    FROM peeps
    JOIN makers ON makers.id = peeps.maker_id
    WHERE peeps.id = $1
    ORDER BY time DESC;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    
    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.content = result_set[0]['content']
    peep.time = result_set[0]['time']
    peep.maker_id = result_set[0]['maker_id'].to_i
    peep.maker_name = result_set[0]['maker_name']
    
    return peep
  end
  
  def find_by_maker(maker_id)
    
    sql = 'SELECT makers.id,
         makers.name,
         makers.email,
         peeps.id AS peep_id,
         peeps.content AS peep_content,
         peeps.time AS peep_time
    FROM makers
    JOIN peeps ON peeps.maker_id = makers.id
    WHERE makers.id = $1
    ORDER BY peep_time DESC;'
    params = [maker_id]
    result_set = DatabaseConnection.exec_params(sql, params)
    
    peeps = []
    
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['peep_id'].to_i
      peep.content = record['peep_content']
      peep.time = record['peep_time']
      
      peeps << peep
    end
    return peeps
  end
  
  def create(peep)
    sql = 'INSERT INTO peeps (content, maker_id) VALUES($1, $2);'
    DatabaseConnection.exec_params(sql, [peep.content, peep.maker_id])
  end
end
