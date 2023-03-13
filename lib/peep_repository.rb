require_relative 'peep'

class PeepRepository

  # Returning all peep records chronologically
  # No arguments
  def all
    @peeps = []

    sql = "SELECT id, content, peep_time, likes, user_id FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |row|
      peep = Peep.new
      peep.id = row['id'].to_i
      peep.content = row['content']
      peep.peep_time = row['peep_time']
      peep.likes = row['likes'].to_i
      peep.user_id = row['user_id'].to_i

      @peeps << peep
    end
    
    return @peeps
  end

  # Creating a new peep record
  # Takes one argument
  def create(peep)
   
    current_likes = 0
    peep.likes = current_likes

    sql = "INSERT INTO peeps (content, peep_time, likes, user_id) VALUES ($1, $2, $3, $4);"
    DatabaseConnection.exec_params(sql, [peep.content, peep.peep_time, peep.likes, peep.user_id])

    return ''
  end
end