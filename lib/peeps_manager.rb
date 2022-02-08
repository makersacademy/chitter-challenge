# frozen_string_literal: true

require './lib/database_connection'
require './lib/peep'

class PeepsManager
  def create_peep(peep, user_email)
    timestamp = date_time_now_string

    DatabaseConnection.query(
      'INSERT INTO peeps(peep, user_email, time)
       VALUES($1, $2, $3);',
       [peep, user_email, timestamp]
     )
  end

  def all
    result = DatabaseConnection.query(
      'SELECT * FROM peeps;'
    )
    result.map do |peep|
      Peep.new(peep['peep'], peep['user_email'], peep['time'])
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
