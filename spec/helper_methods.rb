require 'pg'

def login
  visit '/'
  fill_in('username', :with => 'jonnyb')
  fill_in('password', :with => 'password')
  click_on 'go'
end

def clear_table
  conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'chitter_test' : 'chitter' )
  conn.exec( "TRUNCATE TABLE peeps CASCADE" )
  conn.close if conn
end

# def add_bookmarks
#   conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'chitter_test' : 'chitter'  )
#   conn.exec( "INSERT INTO bookmarks (id, url, title) VALUES ('1', 'www.google.com', 'Google')" )
#   conn.exec( "INSERT INTO bookmarks (id, url, title) VALUES ('2', 'www.destroyallsoftware.com', 'Destroy All Software')" )
#   conn.exec( "INSERT INTO bookmarks (id, url, title) VALUES ('3', 'www.makersacademy.com','Makers')" )
#   conn.close if conn
# end
