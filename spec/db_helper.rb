require 'pg'

module DBHelper
  def self.truncate_peeps
    conn = PG.connect(dbname: ENV['DATABASE'])
    conn.exec('TRUNCATE peeps')
  end
end