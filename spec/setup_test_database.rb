require '/Users/lorrainephillips/Projects/chitter-challenge/lib/database.rb'

def truncate
  Database.exec("TRUNCATE peeps")
end
