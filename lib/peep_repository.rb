require_relative 'peep'

class PeepRepository
  def all_peeps
    peeps = []

    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.datetime = record['datetime']
      peep.user_id = record['user_id']

      peeps << peep
    end

    return peeps
  end
end