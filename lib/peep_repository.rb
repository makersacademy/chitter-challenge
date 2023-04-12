require_relative './peep'
require 'date'

class PeepRepository

  def all
    sql = 'SELECT peeps.id AS "peeps_id", users.username AS "username",
     users.id AS "user_id", peeps.contents AS "contents", peeps.time AS "time"
    FROM peeps
    INNER JOIN users ON peeps.user_id=users.id ORDER BY time desc;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []

    result_set.each do |row|
      peep = Peep.new
      peep.id = row['peeps_id']
      peep.time = row['time']
      peep.contents = row['contents']
      peep.user_id = row['user_id']
      peep.username = row['username']
      peeps << peep
    end
    return peeps
  end
  
  def create_peep(peep)
    sql = 'INSERT INTO peeps (time, contents, user_id)
    VALUES ($1, $2, $3);'

    time = Time.now.strftime("%d/%m/%Y %H:%M")
    sql_params = [time, peep.contents, peep.user_id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end
end
