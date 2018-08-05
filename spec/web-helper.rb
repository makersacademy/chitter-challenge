require 'pg'
# file containing helper code for rspec tests

def setup_test_database
  connection = PG.connect(dbname: 'chitter-test', password: 'qweasd')
  connection.exec("TRUNCATE twats;")
end

def test_date
  '29/06/1993 14:40'
end

def add_twats_to_db
  connection = PG.connect(dbname: 'chitter-test', password: 'qweasd')
  testing_twats.length.times do |i|
    connection.exec("INSERT INTO twats (message, send_time) VALUES('#{testing_twats[i][:msg]}', '#{testing_twats[i][:date]}');")
  end
end

def testing_twats
  [{ date: test_date, msg: 'Hello World! This is my first twat!' }, 
   { date: test_date, msg: ['Lorem ipsum dolor sit amet,',
   'consectetur adipiscing elit,.',
   'sed do eiusmod tempor incididunt ut labore et dolore',
   'magna aliqua. Ut enim ad minim veniam, quis nostrud',
   'exercitation ullamco laboris nisi ut aliquip ex ea',
   'commodo consequat.'].join(' ') }, 
   { date: test_date, msg: ['As a Maker So that I can stay constantly',
   'tapped in to the shouty box of Chitter I want to receive',
    'an email if I am tagged in a Peep'].join(' ') }]
end

def testing_users

end
