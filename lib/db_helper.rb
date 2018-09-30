require 'pg'

module DBHelper
  def self.truncate_peeps
    conn = connect_to_db
    conn.exec('TRUNCATE peeps')
  end

  def self.connect_to_db
    PG.connect( dbname: ENV['DATABASE'])
  end
end