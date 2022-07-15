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
end
