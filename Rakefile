require 'pg'

task :create_test_db do
  create_db('chitter_test')
end

task :create_db do
  create_db('chitter')
end

task :clean_test_db do
  raise 'unable to clean test db - does not exist' unless db_exists? 'chitter_test'

  conn = PG.connect(dbname: 'chitter_test')  
  conn.exec('TRUNCATE peeps, makers')
  conn.close
end

def db_exists?(db_name)
  conn = PG.connect
  result = conn.exec("SELECT datname FROM pg_catalog.pg_database WHERE datname='#{db_name}';")
  conn.close
  result.ntuples == 1
end

def create_db(db_name)
  return if db_exists? db_name

  conn = PG.connect
  conn.exec("CREATE DATABASE #{db_name};")
  conn = PG.connect(dbname: db_name)
  conn.exec('CREATE TABLE makers (id SERIAL PRIMARY KEY, name VARCHAR(30), user_name VARCHAR(30), email VARCHAR(30), password VARCHAR(60));')
  conn.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(280), time TIMESTAMP(0), maker_id INTEGER REFERENCES makers(id));')
  conn.close
end
