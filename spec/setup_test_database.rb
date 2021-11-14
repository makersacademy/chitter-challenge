# frozen_string_literal: true

require 'pg'

def setup_test_database
  puts
  puts 'Setting up test database...'
  user_vals = [
    { :email => 'zimmermja@gmail.com', :password => 'password', :fullname => 'Matt Zimmer', :username => 'Matt' },
    { :email => 'starchild@gmail.com', :password => 'password', :fullname => 'Paul Stanley', :username => 'Starchild' },
    { :email => 'demon@gmail.com', :password => 'password', :fullname => 'Gene Simmons', :username => 'Demon' },
    { :email => 'spaceman@gmail.com', :password => 'password', :fullname => 'Tommy Thayer', :username => 'Spaceman' },
    { :email => 'catman@gmail.com', :password => 'password', :fullname => 'Eric Singer', :username => 'Catman' }
  ]
  peep_vals = [
    { :peep => 'I wanna rock and roll all night and party every day!', :user => 'Starchild', :time => '18:00, 13/11/2021' },
    { :peep => "I was made for lovin' you, baby", :user => 'Catman', :time => '18:05, 13/11/2021' },
    { :peep => 'These are crazy, crazy, crazy, crazy nights! Oh yeah!', :user => 'Demon', :time => '14:00, 14/11/2021' }
  ]

  connection = PG.connect(dbname: 'chitter_zimmja_test')
  connection.exec('TRUNCATE users; TRUNCATE peeps')
  user_vals.each do |user|
    connection.exec_params("INSERT INTO users (email, pword, fullname, username) values($1,$2,$3,$4);",
    [user[:email],user[:password],user[:fullname],user[:username]]) # Broken over two lines to ease readability
  end
  peep_vals.each do |peep|
    connection.exec_params("INSERT INTO peeps (peep, peep_user, peep_time) values($1,$2,$3);",
    [peep[:peep],peep[:user],peep[:time]]) # Broken over two lines to ease readability
  end
end
