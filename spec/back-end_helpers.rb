require_relative './spec_helper'

def database
  PG.connect(dbname: 'bookmark_manager_test', user: 'postgres', password: '')
end

def generate_example_users
  database.query("INSERT INTO USERS (name, email_address, password) VALUES('daniel','daniel_test@test.com','test123password'),('Vanessa','vanessa_test@test.com','test123password')")
end

def generate_example_peeps
  database.query("INSERT INTO peeps (content) VALUES('What do you think about this peep?'),('That is a great peep'),('Thank you!')")
end

def generate_example_user_peeps
  database.query("INSERT INTO user_peeps(thread_id, peep_id, user_id) VALUES(1,1,1),(1,2,2),(1,3,1)")
end

def truncate_db
  return unless ENV['RACK_ENV'] == 'test'

  database.query('TRUNCATE user_peeps, users, peeps, threads RESTART IDENTITY')
end