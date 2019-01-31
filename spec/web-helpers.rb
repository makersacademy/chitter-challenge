require 'rake'

def test_db_initialise
  rake = Rake.application
  rake.init
  rake.load_rakefile
  rake['db:drop'].invoke
  rake['db:setup'].invoke
end
