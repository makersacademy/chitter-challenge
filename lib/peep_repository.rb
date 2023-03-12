require "time"
require_relative "./peep"
require_relative "./record_methods"

class PeepRepository

  def all
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []
      result_set.each do |record|
        peeps << Record.to_peep(record)
      end

    chronologically = peeps.sort_by{ |peep| Time.parse(peep.time) }

    return chronologically.reverse
  end


  def create(peep)
    tags = Peep.get_tags(peep.content)
    sql = 'INSERT INTO peeps (time, content, user_id)
            VALUES($1, $2, $3);'
    sql_params = [peep.time, peep.content, peep.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end
end