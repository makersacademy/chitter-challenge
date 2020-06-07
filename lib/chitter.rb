require 'pg'

class Chitter

def self.all

 connection = PG.connect(dbname: 'chitter_test')
 result = connection.exec('SELECT * FROM posts')


 result.map { |row| row['content'] }

end


end