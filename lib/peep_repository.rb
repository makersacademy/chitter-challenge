require_relative 'peep'

class PeepRepository
  def all
    sql = "SELECT id, content, time, user_id FROM peeps;"
    result = DatabaseConnection.exec_params(sql, [])
    peeps_array = []
    result.each do |row|
      peep = Peep.new
      peep.id, peep.content, peep.time, peep.user_id = 
        row['id'], row['content'], row['time'], row['user_id']
      peeps_array << peep
    end
    return peeps_array
  end
  
  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    params = [peep.content, peep.time, peep.user_id]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end
  
  def find_by_owner(user_id)
    sql = 'SELECT id, content, time, user_id FROM peeps WHERE user_id = $1;'
    result = DatabaseConnection.exec_params(sql, [user_id])
    peeps_array = []
    result.each do |row|
      peep = Peep.new
      peep.id, peep.content, peep.time, peep.user_id = 
        row['id'], row['content'], row['time'], row['user_id']
      peeps_array << peep
    end
    return peeps_array
  end
  
end
