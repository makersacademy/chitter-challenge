require 'pg'

class Peeps
if ENV["RACK_ENV"] == 'test' then
  @@conn = PG.connect(dbname: 'bookmark_manager_test')
else
  @@conn = PG.connect(dbname: 'bookmark_manager')
end


end
