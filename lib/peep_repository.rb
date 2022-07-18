require_relative "peep"

class PeepRepository
  def all
    sql = "SELECT * FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = map_records_to_peep_objects(result_set)
  end

  def find_by_username(username)
    sql = "WITH id AS (SELECT user_id FROM users WHERE username = $1) SELECT * FROM peeps WHERE user_id = (SELECT user_id FROM id);"
    result_set = DatabaseConnection.exec_params(sql, [username])

    raise "This username does not exist in the database." if result_set.to_a.empty?

    peeps = map_records_to_peep_objects(result_set)
  end

  def create(peep)
    sql = "INSERT INTO peeps (content, user_id) VALUES ($1, $2);"
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.user_id])
  end

  def delete(peep)
    sql = "DELETE FROM peeps WHERE peep_id = $1;"

    result_set = DatabaseConnection.exec_params(sql, [peep.peep_id])
  end

  private

  def map_records_to_peep_objects(records)
    peeps = []

    records.each do |record|
      peep = Peep.new
      peep.peep_id = record["peep_id"]
      peep.content = record["content"]
      peep.created = record["created"]
      peep.updated = record["updated"]
      peep.user_id = record["user_id"]

      peeps << peep
    end

    peeps
  end
end
