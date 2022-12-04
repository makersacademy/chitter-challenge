require_relative 'peep'

class PeepRepository

  # Gets all peeps
  def all
    sql = "SELECT id, content, date_and_time, user_id FROM peeps;"
    params = []
    result_set = DatabaseConnection.exec_params(sql, params)
    peeps = []
    result_set.each do |record|
      peeps << record_into_peep(record)
    end
    return peeps
  end

  # Gets all peeps by given user
  def peeps_by_user(id_of_user)
    sql = "SELECT id, content, date_and_time, user_id FROM peeps WHERE user_id = $1;"
    params = [id_of_user]
    result_set = DatabaseConnection.exec_params(sql, params)
    peeps = []
    result_set.each do |record|
      peeps << record_into_peep(record)
    end
    return peeps
  end

  # Finds one peep by its id
  def find_peep_by_id(id_of_peep)
    sql = "SELECT id, content, date_and_time, user_id FROM peeps WHERE id = $1"
    params = [id_of_peep]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    peep = record_into_peep(record)
    return peep
  end

  # Creates a new peep
  def create(peep)
    sql = "INSERT INTO peeps (content, date_and_time, user_id) VALUES ($1, $2, $3);"
    params = [peep.content, peep.date_and_time, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  # converts a record from the database connection result set into a Peep object
  def record_into_peep(record)
    peep = Peep.new
    peep.id = record["id"]
    peep.content = record["content"]
    peep.date_and_time = record["date_and_time"]
    peep.user_id = record["user_id"]
    return peep
  end
end