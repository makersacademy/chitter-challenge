require_relative '../../lib/database_connection'

module DatabaseHelper

  def add_two_peeps
    DatabaseConnection.query("INSERT INTO
      peeps (id, text, time, date, username)
      VALUES
      ('1', 'This is peep 1', '10:45:00', '2018-10-27', 'Mario'),
      ('2', 'This is peep 2', '10:46:00', '2018-10-27', 'Luigi');"
    )
  end

end
