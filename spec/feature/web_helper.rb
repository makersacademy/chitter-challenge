require './lib/peep.rb'

def visit_feed_that_has_peeps
  peeps = create_peeps
    
  visit('/feed')

  peeps
end