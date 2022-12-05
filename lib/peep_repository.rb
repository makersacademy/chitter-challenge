require_relative 'peep'

class PeepRepository
 
  def all #this method will return all Peeps
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time = record['time']
      peep.name = record['name']
      peep.username = record['username']
      peep.user_id = record['user_id']
      peeps << peep
    end
    peeps
  end

  def create(peep) # this will allow us to create a Peep
    sql = 'INSERT INTO peeps (content, time, name, username, user_id) VALUES ($1, $2, $3, $4, $5);'
    params = [peep.content, peep.time, peep.name, peep.username, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
  end
end 
