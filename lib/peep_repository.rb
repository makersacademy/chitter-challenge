require_relative 'peep'
require_relative 'database_connection'

class PeepRepository
  
  def all
    peeps = []

    sql = 'SELECT * FROM peeps;'
    result = DatabaseConnection.exec_params(sql, []) 

    result.each do |record|
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

  # this #find method currently not required
  # but could be useful in future
  def find(id)
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result.first['id'].to_i
    peep.content = result.first['content']
    peep.date_time = result.first['date_time']
    peep.user_f_name = result.first['user_f_name']
    peep.user_handle = result.first['user_handle']

    return peep    
  end

  # this method should become much more efficient
  # could capture user id from Sinatra session
  def create(peep)
    sql = 'INSERT INTO peeps (content, date_time, user_f_name, user_handle) 
           VALUES ($1, $2, $3, $4);'
    sql_params = [peep.content, peep.date_time, peep.user_f_name, peep.user_handle]
    result = DatabaseConnection.exec_params(sql, sql_params)
    peep_id = PeepRepository.new.all.last.id

    sql = 'SELECT id FROM users WHERE handle = ($1);'
    sql_params = [peep.user_handle]
    result = DatabaseConnection.exec_params(sql, sql_params)
    user_id = result.first["id"]

    sql = 'INSERT INTO peeps_users (peep_id, user_id)
           VALUES ($1, $2)'
    sql_params = [peep_id, user_id]
    result = DatabaseConnection.exec_params(sql, sql_params)
  end
end