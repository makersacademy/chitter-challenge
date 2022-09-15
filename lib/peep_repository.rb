require_relative 'peep'
require_relative 'database_connection'

class PeepRepository
  def all
    peeps = []

    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, []) 

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.date_time = record['date_time']
      peep.user_f_name = record['user_f_name']
      peep.user_handle = record['user_handle']
      peeps << peep
    end

    return peeps

  end

  def find(id)
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set.first['id'].to_i
    peep.content = result_set.first['content']
    peep.date_time = result_set.first['date_time']
    peep.user_f_name = result_set.first['user_f_name']
    peep.user_handle = result_set.first['user_handle']

    return peep
    
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ($1, $2, $3, $4);'
    sql_params = [peep.content, peep.date_time, peep.user_f_name, peep.user_handle]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end
end