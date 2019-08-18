def connect(db)
  PG.connect(dbname: db)
end

DB = connect('chitter_test')

def clear(table)
  DB.exec("DROP TABLE peeps;")
  DB.exec(
    "CREATE TABLE peeps(
      id SERIAL PRIMARY KEY,
      text VARCHAR(140),
      created_at TIMESTAMP DEFAULT NOW() 
    );"
  )
end

