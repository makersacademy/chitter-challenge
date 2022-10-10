require_relative 'peep.rb'

class PeepRepository
  
  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT message, tag, created_at FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    peeps = []
    
    result_set.each do |record|
      peep = Peep.new
      peep.message = record['message']
      peep.tag = record['tag']
      peep.created_at = record['created_at']
    peeps << peep
    end
    return peeps
  end

  # finding one record with id as argument
  def find(id)
    sql = 'SELECT message, tag, created_at FROM peeps WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    record = result[0]
    peep = Peep.new
    peep.message = record['message']
    peep.tag = record['tag']
    peep.created_at = record['created_at']
    return peep
  end

  # inserting a new record with instance of Peep class as argument
  def create(peep)
    sql = 'INSERT INTO peeps (message, tag, created_at) VALUES ($1, $2, $3);'
    params = [peep.message, peep.tag, peep.created_at]
    DatabaseConnection.exec_params(sql, params)
  end
end