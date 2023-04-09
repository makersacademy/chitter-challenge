require_relative 'peep'
require_relative 'database_connection'

class PeepRepository

  def all
    # returns all rows in reverse chronological order
    sql = 'SELECT peep, date, username_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []
    result_set.each do |row|
      new_peep = Peep.new
      new_peep.id = row['id']
      new_peep.peep = row['peep']
      new_peep.date = row['date']
      new_peep.username_id = row['username_id']
      peeps << new_peep
    end
    return peeps
  end

  def create(message)
    sql = 'INSERT INTO peeps (peep, date, username_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [message.peep, message.date, message.username_id])

    return message
  end
end