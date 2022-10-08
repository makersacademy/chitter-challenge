require_relative 'peeps'

class PEEPS
  def all
    peeps = []
    sql = 'SELECT * FROM peeps'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |info| 
      peep = PEEP.new
      peep.id = info['id']
      peep.content = info['content']
      peep.user_id = info['user_id']
      peeps << peep
    end
    return peeps.reverse
  end

  def find(id)
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = PEEP.new
    peep.id = result_set[0]['id'].to_i
    peep.content = result_set[0]['content']
    peep.user_id = result_set[0]['username']
    return peep 
  end 

  def create(peep)
    sql = 'INSERT INTO peeps (content, user_id) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.user_id])
    return peep
  end

  def delete(peep)
    sql = 'DELETE FROM peeps WHERE content = ?;'
    DatabaseConnection.exec_params(sql, [peep]);
  end
end
