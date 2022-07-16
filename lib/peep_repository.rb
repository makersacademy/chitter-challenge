require_relative './peep'

class PeepRepository
  def all 
    sql = "SELECT * FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.date = record['date']
      peep.user_id = record['user_id']
      peeps << peep
    end
    return peeps
  end

  def find(user_id)
    sql = 'SELECT id, content, date, user_id FROM peeps WHERE user_id = $1;'
    param = [user_id]
    result_set = DatabaseConnection.exec_params(sql, param)
    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.date = record['date']
      peep.user_id = record['user_id']
      peeps << peep
    end
    return peeps
  end

  def create(new_peep)
    sql = 'INSERT INTO peeps (id, content, date, user_id) VALUES ($1, $2, $3, $4);'
    param = [new_peep.id, new_peep.content, new_peep.date, new_peep.user_id]
    result_set = DatabaseConnection.exec_params(sql, param)
    return ''
  end
end
