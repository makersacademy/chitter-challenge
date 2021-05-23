require 'pg'
def truncate
  con = PG.connect(dbname: "chitter_test")

  con.exec("TRUNCATE peeps")
end
