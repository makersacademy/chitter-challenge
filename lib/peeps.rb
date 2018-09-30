require_relative './db_helper.rb'

class Peeps
  def self.all
    conn = DBHelper.connect_to_db
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
    conn = DBHelper.connect_to_db
    conn.exec("INSERT INTO peeps(message) VALUES('#{msg}')")
  end
end