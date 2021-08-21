def set_table
  PG.connect dbname:"chitter_test"
  Cheet.create("The world is flat")  
end 