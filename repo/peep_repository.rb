require_relative '../models/user'
require_relative '../models/peep'

class PeepRepository

  def create(peep)
    sql = 'INSERT INTO peeps (content, author) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.author])
  end

  def all
    peeps = []
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |peep|
      obj = Peep.new
      obj.peep_id = peep['peep_id']
      obj.created_on = peep['created_on']
      obj.content = peep['content']
      obj.author = peep['author'].to_i

      peeps.push(obj)
    end
    return peeps
  end

end