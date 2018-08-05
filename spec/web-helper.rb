require 'pg'
# file containing helper code for rspec tests
def setup_test_database
  connection = PG.connect(dbname: 'chitter-test', password: 'qweasd')
  connection.exec("TRUNCATE twats;")
end

def add_twats_to_db
  connection = PG.connect(dbname: 'chitter-test', password: 'qweasd')
  testing_twats.length.times do |i|
    connection.exec("INSERT INTO twats (message) VALUES('#{testing_twats[i]}');")
  end
end

def testing_twats
  ['Hello World! This is my first twat!', 
  ['Lorem ipsum dolor sit amet, consectetur adipiscing elit,.',
   'sed do eiusmod tempor incididunt ut labore et dolore',
   'magna aliqua. Ut enim ad minim veniam, quis nostrud',
   'exercitation ullamco laboris nisi ut aliquip ex ea',
   'commodo consequat.'].join(' '), ['As a Maker',
   'So that I can stay constantly tapped in to the shouty',
   'box of Chitter I want to receive an email if I am tagged',
   'in a Peep'].join(' ')]
end

def testing_users

end
