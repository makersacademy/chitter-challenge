require 'pg'

def clean_database
  conn = PG.connect( dbname: 'chitter_database_test')
  conn.exec("TRUNCATE peeps;")
  conn.exec("TRUNCATE users;")
end

def build_database
  conn = PG.connect( dbname: 'chitter_database_test')
  conn.exec("INSERT INTO peeps VALUES(DEFAULT,'This is an example peep',  '2019-03-03 12:06') ")
  conn.exec("INSERT INTO peeps VALUES(DEFAULT,'Here is a peep I made earlier',  '2019-03-03 11:06') ")
  conn.exec("INSERT INTO peeps VALUES(DEFAULT,'This is a peep I made yesterday',  '2019-03-02 12:06') ")
  conn.exec("INSERT INTO users VALUES(DEFAULT, 'SteveKahn1', 'password', 'stevekahn@gmail.com', 'Steve', 'Kahn')")
end
