require 'pg'

class PGDatabase
  def self.make_connection(db)
    @db_session = PG.connect(dbname: db)
  end

  def self.truncate_tables
    @db_session.exec("TRUNCATE peeps, users;")
  end

  def self.select_peeps
    @db_session.exec("SELECT * FROM peeps;")
  end
end
