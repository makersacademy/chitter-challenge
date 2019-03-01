require './lib/peep.rb'

def empty_database
  Peep.delete_all
end

def create_peeps
  peeps = [{ content: 'Right???!!!' }, { content: 'Trump sucks' }]

  peeps.each do |peep|
    Peep.create(peep)
  end

  return peeps
end