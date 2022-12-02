require_relative 'peep'

class PeepRepository

  # Gets all peeps
  # No arguments
  def all
    # Executes the SQL query:
    sql = "SELECT id, content, date_and_time, user_id FROM peeps;"
    params = []

    result_set = DatabaseConnection.exec_params(sql, params)

    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record["id"]
      peep.content = record["content"]
      peep.date_and_time = record["date_and_time"]
      peep.user_id = record["user_id"]

      peeps << peep
    end

    return peeps
  end

  # Gets all peeps by given user
  # One argument: the (user)id (number)
  def peeps_by_user(id_of_user)
    # Check if user_id exists, raise error if it doesn't
    result_set_1 = DatabaseConnection.exec_params("SELECT user_id FROM peeps", [])
    
    existing_user_ids = []

    result_set_1.each do |record|
      user_id = record["user_id"]
      existing_user_ids << user_id
    end

    raise "This user does not exist" if !existing_user_ids.include?(id_of_user.to_s)
    

    # Get all peeps by given user
    # Executes the SQL query:
    sql = "SELECT id, content, date_and_time, user_id FROM peeps WHERE user_id = $1;"
    params = [id_of_user]

    result_set_2 = DatabaseConnection.exec_params(sql, params)

    peeps = []

    result_set_2.each do |record|
      peep = Peep.new
      peep.id = record["id"]
      peep.content = record["content"]
      peep.date_and_time = record["date_and_time"]
      peep.user_id = record["user_id"]

      peeps << peep
    end

    return peeps
  end

  # creates a new peep
  # takes one argument: a Peep object
  def create(peep)
    # Executes the SQL query:
    raise "Peeps must be at least 1 character long" if peep.content == ""
    
    sql = "INSERT INTO peeps (content, date_and_time, user_id) VALUES ($1, $2, $3);"
    params = [peep.content, peep.date_and_time, peep.user_id]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  # # allows user to delete a peep they've posted
  # def delete(peep)
  #   TBC
  # end
end