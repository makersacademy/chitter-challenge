require_relative './peep'

class PeepRepository
  def all
    sql = 'SELECT id, content, time, user_id FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    peeps = []

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

  # def find(id)
  #   sql = 'SELECT id, content, time, user_id FROM users WHERE id = $1;'
  #   sql_params = [id]

  #   result_set = DatabaseConnection.exec_params(sql, sql_params)
  #   record = result_set[0]

  #   peep = Peep.new
  #   peep.id = record['id']
  #   peep.content = record['content']
  #   peep.time = record['time']
  #   peep.user_id = record['user_id']

  #   return peep
  # end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES($1, $2, $3);'
    sql_params = [peep.content, peep.time, peep.user_id]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    sql_params = [id]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
end