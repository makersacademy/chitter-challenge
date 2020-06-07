require 'pg'
require './lib/chitter.rb'
def clear_table
 connection = PG.connect(dbname: 'chitter_test')
 connection.exec('TRUNCATE TABLE posts;')
end

def add_test_data
 Chitter.create('CNN is FAKE NEWS')
 Chitter.create('Mexico will pay for the wall!')
 Chitter.create("Its freezing and snowing in New York--we need global warming!")
end