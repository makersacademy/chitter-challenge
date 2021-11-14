require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: "chitter#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    result = connection.exec('SELECT peeps."content", chit_user."name",
      chit_user.user_name, peeps."timestamp"
      FROM peeps
        INNER JOIN chit_user ON chit_user.chit_user_id = PEEPS.chit_user_id
      ORDER BY timestamp DESC;')
    result.map { |peep| peep}
# (peep['content'], peep["'chit_user.'name'"], peep['chit_user.user_name'], peep['timestamp']) }

  end
end

# TODO: need to update the iteration on line 8 to return all peep column info (except ID)
# TODO: need to sort result for view_peeps page to display in reverse chronological order
