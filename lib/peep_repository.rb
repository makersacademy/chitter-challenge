require 'peep'

class PeepRepository
  def all
    sql = "SELECT id, content, time_posted, user_id FROM peeps ORDER BY time_posted DESC;"
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.user_id = record['user_id']
      peeps << peep
    end

    return peeps
  end

  def create(peep)

  end
end