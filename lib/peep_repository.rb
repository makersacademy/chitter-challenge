require_relative './peep'
require 'date'

class PeepRepository

  def all
    sql = 'SELECT id, time, contents, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []

    result_set.each do |row|
      peep = Peep.new
      peep.id = row['id']
      peep.time = row['time']
      peep.contents = row['contents']
      peep.user_id = row['user_id']
      peeps << peep
    end
    return peeps
  end
  
  def create_peep
    # relay the time of the peep
    # contents of the peep
  end
end
