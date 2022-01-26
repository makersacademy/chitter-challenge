require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first #result will only yield one result, but we need to call first because result is an enumerator with a hash(or multiple if there were duplicate ids) inside it. we need to call .first to instruct it to look at this hash. can think of it like this: result = [ { 'id': 1, 'peep': 'this is a peep', 'username': 'me' } ] (although it's not technically an array)
end 

# the 'persisted_data' method in database_helpers.rb, is essentially a .find method (you feed it an id and it returns the line of the database corresponding to that id).
# The only difference is that a .find method in a class .rb file (there's one in our user.rb), also wraps the line from the database (returned as a hash from sql) into a ruby class instance.
# The 'persisted_data' method, doesn't do any wrapping, it just returns the hash for that record from the database. However, it does still mean that it can potentially be used as a catch-all method for reading lines from database tables.

