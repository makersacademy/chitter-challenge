require_relative './peep.rb'

class PeepRepository
  def all

  end

  def find

  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, creation_date, user_id) VALUES ($1, NOW(), $2)'
    DatabaseConnection.exec_params(sql, [peep.content, peep.user_id])
  end
end