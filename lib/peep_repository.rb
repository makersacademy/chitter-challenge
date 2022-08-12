require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.date_time = record['date_time']
      peep.user_id = record['user_id'].to_i
      peeps << peep
      end
    peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps ("content", "date_time", "user_id") VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.date_time, peep.user_id])
  
    return nil
  end
end