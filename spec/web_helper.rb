def set_table
  PG.connect dbname: "chitter_test"
  cheet = Cheet.new
  cheet.create("The world is flat") 
  cheet.create("Hello flat world") 
end

def set_table2 
  PG.connect dbname: "chitter_test"
  email = Email.new
  email.add("myemail@gmail.com")
end 
