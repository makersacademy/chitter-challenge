require_relative '../database'

=begin
CREATE TABLE peep (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  text TEXT NOT NULL,
  date timestamp NOT NULL,
  FOREIGN KEY (username) REFERENCES chitter_user(username)
);
=end

class Peep
  def self.create(params)
    connection = Database.connection

    username = params[:username]
    text = params[:text]
    date = Time.now

    connection.exec_params("INSERT INTO peep (username, text, date) VALUES ($1, $2, $3)",
                           [username, text, date])
  end

  def self.all
    connection = Database.connection
    return connection.exec("SELECT peep.*, chitter_user.* "\
      "FROM peep INNER JOIN chitter_user "\
      "ON peep.username=chitter_user.username "\
      "ORDER BY DATE DESC;").to_a
  end
end
