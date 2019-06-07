require 'pg'

def truncates
    DatabaseConnection.query('TRUNCATE peeps RESTART IDENTITY')
end

def add_peep
  DatabaseConnection.query("INSERT INTO peeps(author, handle, content) 
  VALUES('#{'Lin'}', '#{'@LinnyCodes'}', '#{'Hey, this is my first test peep!'}')")
end