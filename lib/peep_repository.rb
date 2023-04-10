require_relative "peep"

class PeepRepository
  def all
    peeps = []
    sql = "SELECT users.username, users.name, peeps.id, peeps.content, peeps.created_at, peeps.user_id
            FROM peeps
              JOIN users
              ON users.id = peeps.user_id ORDER BY peeps.id DESC;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.username = record["username"]
      peep.name = record["name"]
      peep.id = record["id"]
      peep.content = record["content"]
      peep.created_at = record["created_at"]
      peep.user_id = record["user_id"]
      peeps << peep
    end
    return peeps
  end

  def create(peep)
    sql = "INSERT INTO peeps (content, user_id) VALUES ($1, $2);"
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.user_id])

    return peep
  end
end