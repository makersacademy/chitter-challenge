def set_table
  PG.connect dbname:"chitter_test"
  cheet = Cheet.new
  cheet.create("The world is flat") 
  cheet.create("Hello flat world") 
end 