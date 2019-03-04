require './lib/peep.rb'
require './lib/user.rb'

def empty_database
  Peep.delete_all
  User.delete_all
end

def create_peeps
  peeps = [{ content: 'Right???!!!' }, { content: 'Trump sucks' }]
  saved_peeps = []

  peeps.each do |peep|
    saved_peeps << Peep.create(peep)
  end
  
  return saved_peeps
end
