class CreateTables
  def self.if_not_exists(connection)
    connection.exec("
      CREATE TABLE IF NOT EXISTS users(
      id SERIAL PRIMARY KEY,
      mail VARCHAR(40) NOT NULL,
      password VARCHAR(40) NOT NULL,
      name VARCHAR(100) NOT NULL,
      username VARCHAR(40) NOT NULL,
      created_at TIMESTAMP NOT NULL,
      updated_at TIMESTAMP NOT NULL default current_timestamp
      )
    ")
  end
end
