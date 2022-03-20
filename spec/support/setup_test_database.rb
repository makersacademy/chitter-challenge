require 'pg'

def setup_test_database(database_name = 'chitter_test')
  connection = PG.connect(dbname: database_name)
  create_command = "CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content VARCHAR(60),
    maker_id INT,
    created TIMESTAMP with time zone DEFAULT now()
  );"
  # Would this be better/faster if it created a table if it DID NOT exist?
  # Then truncate the one that is there
  connection.exec("DROP TABLE IF EXISTS peeps;")
  connection.exec(create_command)
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
