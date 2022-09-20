require_relative './database_connection'
require_relative './peep'


class PeepRepository
  def all
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    all_peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.date = record['date']
      peep.user_id = record['user_id']
      all_peeps << peep
    end
    all_peeps
  end

  def add(peep)
    sql = 'INSERT INTO peeps (content, date, user_id) VALUES ($1, $2, $3);'
    sql_params = [peep.content, peep.date, peep.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end
end

