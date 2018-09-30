require 'pg'

class Peeps
  def self.all
    conn = connect_to_db
    res = conn.exec("
      SELECT
        message,
        TO_CHAR(created_at, 'HH24:MI DD/MM/YY')
      FROM
        peeps
      ORDER BY
        created_at DESC
    ")

    res.map do |peep| {
      msg: peep['message'],
      created_at: peep['to_char']
      }
    end
  end

  def self.add(msg)
    conn = connect_to_db
    conn.exec("INSERT INTO peeps(message) VALUES('#{msg}')")
  end

  private
  def self.connect_to_db
    PG.connect( dbname: ENV['DATABASE'])
  end
end