require_relative './spec_helper'

def database
  PG.connect(dbname: 'chitter_test', user: 'postgres', password: '')
end

def generate_example_users
  database.query("INSERT INTO USERS (name, email_address, password) VALUES('daniel','daniel_test@test.com','test123password'),('Vanessa','vanessa_test@test.com','test123password')")
end

def generate_example_peeps
  #database.query("INSERT INTO peeps (content) VALUES('What do you think about this peep?'),('That is a great peep'),('Thank you!')")
  database.query("INSERT INTO peeps (content) VALUES('What do you think about this peep?')")
  database.query("INSERT INTO peeps (content) VALUES('That is a great peep')")
  database.query("INSERT INTO peeps (content) VALUES('Thank you!')")
end

def generate_example_user_peeps
  database.query("INSERT INTO user_peeps(thread_id, peep_id, user_id) VALUES(1,1,1),(1,2,2),(1,3,1)")
end

def generate_example_threads
  database.query("INSERT INTO threads(id) VALUES(1)")
end

def generate_all_examples
  generate_example_users
  generate_example_threads
  generate_example_peeps
  generate_example_user_peeps
end

def generate_examples_wait
  generate_example_users
  generate_example_threads
  sleep(1)
  database.query("INSERT INTO peeps (content) VALUES('What do you think about this peep?')")
  sleep(1)
  database.query("INSERT INTO peeps (content) VALUES('That is a great peep')")
  sleep(1)
  database.query("INSERT INTO peeps (content) VALUES('Thank you!')")
end

def db_data(params = '*', id:, table:)
  database.query("SELECT #{params} FROM #{table} WHERE id=#{id}")
end

def truncate_db
  return unless ENV['RACK_ENV'] == 'test'

  database.query('TRUNCATE user_peeps, threads, users, peeps RESTART IDENTITY')
end

