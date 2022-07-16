require_relative 'peep'

class PeepRepo
  def all
    peeps = []
    sql = "SELECT * FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |result|
      new_peep = Peep.new
      new_peep.content = result['content']
      new_peep.author_id = result['author_id'].to_i
      new_peep.time_posted = result['time_posted']
      peeps << new_peep
    end
    return peeps
  end

  def create_peep(peep)
    sql = "INSERT INTO peeps (content, author_id, time_posted) VALUES ($1,$2, $3);"
    params = [peep.content, peep.author_id, peep.time_posted]
    DatabaseConnection.exec_params(sql, params)
    return peep
  end
end
