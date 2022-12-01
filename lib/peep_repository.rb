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

end