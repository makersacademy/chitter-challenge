def amend_db(insert_sql)
  begin
    con = PG.connect :dbname => 'chitter_manager_test', :user => 'arav'
    rs = con.exec insert_sql
  
  rescue PG::Error => e
   puts e.message 

  ensure
    rs.clear if rs
    con.close if con 
  end 
end