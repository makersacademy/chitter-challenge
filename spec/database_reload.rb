require 'pg'

def reload_test_database
  con = PG.connect(dbname: 'chitter_test')
  con.exec("TRUNCATE TABLE peeps;")
  con.exec("INSERT INTO peeps (message, makerid, createstamp) VALUES ('The first ever peep', NULL, '2019-03-02 12:10:40.790703');")
  con.exec("INSERT INTO peeps (message, makerid, createstamp) VALUES ('The second ever peep', NULL, '2019-03-02 12:12:40.790703');")
  con.exec("TRUNCATE TABLE makers;")
  con.exec("INSERT INTO makers (name, username, email, password) VALUES ('Fred Flintstone', 'freddie', 'fred@fred.com', 'freddiepwd');")
  results = con.exec("SELECT id FROM makers where username = 'freddie';")
  makerid = results.first['id'];
  con.exec("UPDATE peeps SET makerid = #{makerid};")
end
