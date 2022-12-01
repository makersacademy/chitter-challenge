require_relative 'peep'

class PeepRepository

  def all
    peeps = []

    sql = 'SELECT id, content, date_time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|

      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.date_time = record['date_time']
      peep.user_id = record['user_id']

      peeps << peep
    end

    return peeps
  end

  def find(id)
    sql = 'SELECT id, content, date_time, user_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id']
    peep.content = result_set[0]['content']
    peep.date_time = result_set[0]['date_time']
    peep.user_id = result_set[0]['user_id']

    return peep
  end

end