require 'pg'

def setup_test_database(database_name = 'chitter_test')
  connection = PG.connect(dbname: database_name)
  create_peeps = "CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content VARCHAR(60),
    maker_id INT,
    created TIMESTAMP with time zone DEFAULT now()
  );"
  create_users = "CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    email VARCHAR(60),
    password VARCHAR(60),
    username VARCHAR(60),
    created TIMESTAMP with time zone DEFAULT now()
  );"
  # Would this be better/faster if it created a table if it DID NOT exist?
  # Then truncate the one that is there
  connection.exec("DROP TABLE IF EXISTS peeps;")
  connection.exec(create_peeps)
  connection.exec("DROP TABLE IF EXISTS users;")
  connection.exec(create_users)
end

def add_default_peeps_to_test_database(database_name = 'chitter_test')
  connection = PG.connect(dbname: database_name)
  defaults = [
    { 'content' => "I'm the first Peep" },
    { 'content' => "I'm the second Peep" },
    { 'content' => "I'm the third Peep" },
  ]
  defaults.each do |default_entry|
    params = [default_entry['content']]
    connection.exec_params("INSERT INTO peeps (content) VALUES ($1);", params)
  end
end

def add_default_users_to_test_database(database_name = 'chitter_test')
  connection = PG.connect(dbname: database_name)
  defaults = [
    { 
      'name' => 'Paul',
      'email' => 'paul@internet.com',
      'password' => 'Tr1ckyPa55w0rd',
      'username' => 'PaulK' 
    }
  ]
  defaults.each do |default_user|
    params = [default_user['name'], default_user['email'], default_user['password'], default_user['username']]
    connection.exec_params("INSERT INTO users (name, email, password, username) VALUES ($1, $2, $3, $4);", params)
  end
end
