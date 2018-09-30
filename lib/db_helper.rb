require 'pg'

module DBHelper
  def self.truncate_dbs
    conn = connect_to_db
    conn.exec('TRUNCATE peeps, users')
  end

  def self.connect_to_db
    PG.connect( dbname: ENV['DATABASE'])
  end
end