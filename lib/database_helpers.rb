require 'pg'
require_relative 'database_connection'

def setup_test_database
  conn = PG.connect(dbname: 'peep_manager_test')
  conn.exec('TRUNCATE TABLE peeps')
end

def add_test_bookmarks
  Peep.create(comment: 'Test comment number one')
  Peep.create(comment: 'Test comment number two')
  Peep.create(comment: 'Test comment number three')
end

def persisted_data(id:)
  conn = PG.connect(dbname: 'peep_manager_test')
  conn.query("Select * FROM peeps where id = #{id};")
end

def setup_connection
  if ENV['ENVIRONMENT'] == 'test'
    conn = PG.connect(dbname: 'peep_manager_test')
  else
    conn = PG.connect(dbname: 'peep_manager')
  end
end
