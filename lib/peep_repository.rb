require_relative 'peep'
require 'date'

class PeepRepository
  def all
    sql = "SELECT peeps.id, peeps.content, peeps.time_posted, users.username, peeps.user_id FROM peeps JOIN users ON peeps.user_id = users.id ORDER BY time_posted DESC;"
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time_posted = record['time_posted']
      peep.username = record['username']
      peep.user_id = record['user_id']
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