require_relative "peep"

class PeepRepository
  def all
    peeps = []

    sql = "SELECT id, content, time_posted, user_id FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record["id"].to_i
      peep.content = record["content"]
      peep.time_posted = record["time_posted"]
      peep.user_id = record["user_id"].to_i

      peeps << peep
    end

    return peeps
  end

  def create(peep)
    sql = "INSERT INTO peeps (content, time_posted, user_id) VALUES ($1, $2, $3);"
    params = [peep.content, peep.time_posted, peep.user_id]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end
end
