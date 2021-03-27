require 'pg'

def login
  visit '/'
  fill_in('email', :with => 'caesar@conures.com')
  fill_in('password', :with => 'parrots1')
  click_on 'go'
end

def clear_table
  conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'chitter_test' : 'chitter' )
  conn.exec( "TRUNCATE TABLE peeps CASCADE" )
  conn.exec( "TRUNCATE TABLE users CASCADE" )
  conn.close if conn
end

def add_peeps
  conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'chitter_test' : 'chitter'  )
  conn.exec( "INSERT INTO users (id, email, password, name) VALUES ('1', 'caesar@conures.com', 'parrots1', 'Caesar')")
  conn.exec( "INSERT INTO peeps (text, date, time, user_id) VALUES ('I love parrots', '2021-03-27', '12:17:00', '1')")
  conn.exec( "INSERT INTO peeps (text, date, time, user_id) VALUES ('Makers is awesome', '2020-05-18', '21:23:00', '1')" )
  conn.exec( "INSERT INTO peeps (text, date, time, user_id) VALUES ('Bonald Rump sucks', '2021-01-04', '15:43:00', '1')" )
  conn.close if conn
end

def create_account
  visit '/'
  click_on 'Create Account'
  fill_in('name', :with => 'Caesar')
  fill_in('email', :with => 'caesar@conures.com')
  fill_in('password', :with => 'parrots1')
  click_on 'go'
end
