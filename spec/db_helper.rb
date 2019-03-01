require './lib/peep.rb'

def empty_database
  Peep.delete_all
end