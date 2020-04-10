require 'pg'

task :create_test_db do
  create_db('chitter_test')
end

task :create_db do
  create_db('chitter')
end

def db_exists?(db_name)
  conn = PG.connect
  result = conn.exec("SELECT datname FROM pg_catalog.pg_database WHERE datname='#{db_name}';")
  result.ntuples == 1
end

def create_db(db_name)
  if !db_exists? db_name
    conn = PG.connect
    conn.exec("CREATE DATABASE #{db_name};")
    conn = PG.connect(dbname: db_name)
    conn.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(280), time TIMESTAMP(0));')
  end
end