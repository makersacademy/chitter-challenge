require 'pg'

class Peep
  def self.all
    # connection = PG.connect(dbname: 'chitter_' + ENV['RACK_ENV'])
    result = DatabaseConnection.query("SELECT users.name, users.handle,
                                      peeps.text, peeps.time
                                      FROM users
                                      INNER JOIN peeps
                                      ON users.id = peeps.user_id
                                      ORDER BY peeps.id")
    result.map { |peep| {
      text: peep['text'], name: peep['name'],
      time: peep['time'], handle: peep['handle']
      } }.reverse
  end

  def self.create(peep, id)
    peep[:text].gsub!("'", "''")
    # connection = PG.connect(dbname: 'chitter_' + ENV['RACK_ENV'])
    DatabaseConnection.query("INSERT INTO peeps (text, time, user_id) VALUES
                                  ('#{peep[:text]}',
                                  '#{peep[:time]}',
                                  '#{id}')")
  end
end
