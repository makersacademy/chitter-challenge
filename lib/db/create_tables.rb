class CreateTables

  def self.if_not_exists(connection)
    connection.exec("
      CREATE TABLE IF NOT EXISTS users(
      id SERIAL PRIMARY KEY,
      email VARCHAR(40) NOT NULL UNIQUE,
      password VARCHAR(40) NOT NULL,
      name VARCHAR(100) NOT NULL,
      username VARCHAR(40) NOT NULL UNIQUE,
      created_at TIMESTAMP default current_timestamp,
      updated_at TIMESTAMP default current_timestamp
      )
    ")

    connection.exec("
      CREATE TABLE IF NOT EXISTS peeps(
      id SERIAL PRIMARY KEY,
      foreign_key_user_id INT,
      foreign_key_username VARCHAR(30) NOT NULL,
      peep VARCHAR(50) NOT NULL,
      created_at TIMESTAMP default current_timestamp,
      updated_at TIMESTAMP default current_timestamp
      )
    ")
  end

end
