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

  def self.add_peep(post:)
    @db_session.exec_params("INSERT INTO peeps (timestamp, post) VALUES (NOW(), $1) RETURNING id, timestamp, post;", [post])
  end
end
