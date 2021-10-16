# frozen_string_literal: true

require 'database_connection'
require 'peep'

class PeepsManager
  def create_peep(peep)
    timestamp = date_time_now_string

    DatabaseConnection.query(
      'INSERT INTO peeps(peep, time)
       VALUES($1, $2);',
       [peep, timestamp]
     )
  end

  def all
    result = DatabaseConnection.query(
      'SELECT * FROM peeps;'
    )
    result.map do |peep|
      Peep.new(peep['peep'], peep['time'])
    end
  end

  def all_in_time_order
    all.sort_by { |peep| peep.time }.reverse
  end

  private

  def date_time_now_string
    DateTime.now.to_s
  end
end
