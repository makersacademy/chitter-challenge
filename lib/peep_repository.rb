require_relative 'peep'

class PeepRepository
  def all
    peeps = []
    sql = 'SELECT * FROM peeps'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.title = record['title']
      peep.content = record['content']
      peep.time_stamp = record['time_stamp']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    end
    peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps(title, content, time_stamp, user_id) VALUES($1, $2, $3, $4);'
    params = [peep.title, peep.content, peep.time_stamp, peep.user_id]
    
    new_peep = DatabaseConnection.exec_params(sql, params)
  end
end
