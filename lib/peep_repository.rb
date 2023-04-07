require "peep"

class PeepRepository
  def all
    peeps = []
    sql = "SELECT id, message, published, user_id FROM peeps"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record["id"]
      peep.message = record["message"]
      peep.published = record["published"]
      peep.user_id = record["user_id"]
      peeps << peep
    end
    return peeps
  end

  def create(peep)
    sql = "INSERT INTO peeps (message, published, user_id) VALUES ($1, $2, $3);"
    result_set = DatabaseConnection.exec_params(sql, [peep.message, peep.published, peep.user_id])

    return peep
  end
end