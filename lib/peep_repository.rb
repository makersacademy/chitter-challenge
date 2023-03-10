require_relative "./peep"
require "time"

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []
    result_set.each do |data|
      peep = Peep.new
      peep.id = data["id"]
      peep.time = data["time"]
      peep.content = data["content"]
      peep.user_id = data["user_id"]
      peeps << peep
    end

    chronologically = peeps.sort_by{ |peep| Time.parse(peep.time) }

    return chronologically.reverse
  end
end