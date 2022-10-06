require_relative './peep.rb'

class PeepRepository
  def all

  end

  def find

  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, creation_date, user_id) VALUES ($1, $2, $3)'
    DatabaseConnection.exec_params(sql, [peep.content, peep.creation_date, peep.user_id])
  end
end