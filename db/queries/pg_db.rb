require 'pg'

class PGDatabase
  def self.make_connection(db)
    @db_session = PG.connect(dbname: db)
  end

  def self.truncate_tables
    @db_session.exec("TRUNCATE peeps, users;")
  end

  # Peeps

  def self.select_peeps
    @db_session.exec("SELECT * FROM peeps;")
  end

  def self.add_peep(post:)
    @db_session.exec_params("INSERT INTO peeps (timestamp, post) VALUES (NOW(), $1) RETURNING id, timestamp, post;", [post])
  end

  # Users

  def self.new_user(name:, username:, email:, password:)
    @db_session.exec_params("INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4) RETURNING id, name, username, email;", [name, username, email, password])
  end

  def self.find_user(id:)
    @db_session.exec_params("SELECT * FROM users WHERE id = $1;",[id])
  end
end
